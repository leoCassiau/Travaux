import java.util.ArrayList;
import java.util.List;

import choco.Choco;
import choco.cp.model.CPModel;
import choco.cp.solver.CPSolver;
import choco.kernel.common.logging.ChocoLogging;
import choco.kernel.model.Model;
import choco.kernel.model.constraints.pack.PackModeler;
import choco.kernel.model.variables.integer.IntegerExpressionVariable;
import choco.kernel.model.variables.integer.IntegerVariable;
import choco.kernel.solver.Solver;

public class NRJConstraint {

    private Model model = new CPModel();
    private PhysVirtConfiguration config;
    private List<VM> virtualMachines;
    private List<Machine> machines;

    private PackModeler pmMemory;
    private PackModeler pmCpu;
    private IntegerVariable[] pmEnergy;
    private boolean spreadConstraint = false;

    public NRJConstraint(PhysVirtConfiguration conf, boolean bool) {
	config = conf;
	machines = config.getMachines();
	virtualMachines = config.getVms();
	spreadConstraint = bool;

    }

    public void newModel(int configPower, String methodUsed) {
	int[] vmMemory = new int[virtualMachines.size()];
	int[] vmCpu = new int[virtualMachines.size()];
	int[] vmIdMemory = new int[virtualMachines.size()];
	int[] vmIdCpu = new int[virtualMachines.size()];
	pmEnergy = new IntegerVariable[machines.size()];

	int ind = 0;
	for (VM v : virtualMachines) {
	    vmMemory[ind] = v.getMemory();
	    vmCpu[ind] = v.getCpu();
	    vmIdMemory[ind] = v.getId();
	    vmIdCpu[ind] = v.getId();
	    ind++;
	}

	bubbleSort(vmMemory, vmIdMemory);
	bubbleSort(vmCpu, vmIdCpu);

	// Pack virtual machines on machines according to cpu and memory
	// Memory
	pmMemory = new PackModeler(vmMemory, machines.size(), 32);
	model.addConstraints(Choco.pack(pmMemory));
	// CPU
	/* Q2 : Faire la meme chose pour le CPU */
	// A remplir : 2 lignes
	pmCpu = new PackModeler(vmCpu, machines.size(), 16);
	model.addConstraint(Choco.pack(pmCpu));

	int itm = 0;
	// Q2 : Preciser le role de la boucle suivante.
	// Réponse : Cette boucle sert à ajouter des contraintes pour chaque
	// machine qui a une capacité mémoire inférieur à 32 ou une capacité CPU
	// inférieur à 16
	//
	for (Machine m : machines) {
	    if (m.getMemory() != 32) {
		model.addConstraints(Choco.leq(pmMemory.loads[itm],
			m.getMemory()));
	    }
	    if (m.getCpu() != 16) {
		model.addConstraints(Choco.leq(pmCpu.loads[itm], m.getCpu()));
	    }
	    itm++;
	}

	// Link memory of virtual machines to their cpu
	for (int element : vmIdMemory) {
	    for (int element2 : vmIdCpu) {
		if (element == element2) {
		    // Q2 : Lier le bin CPU avec le bin Memoire
		    // A remplir : 1 ligne element = vmIdMemory[i] et non i
		    model.addConstraints(Choco.eq(pmMemory.bins[element],
			    pmCpu.bins[element2]));
		}
	    }
	}

	// Compute Energy consumption
	IntegerVariable totalEnergy = Choco.makeIntVar("Energy", 0,
		configPower, "cp:objective");
	pmEnergy = new IntegerVariable[machines.size()];

	int idx = 0;
	int b = 0;
	if (methodUsed.equals("FIRST")) {
	    for (Machine m : machines) {
		pmEnergy[b] = Choco.makeIntVar("pmEnergy_" + m.getName(), 0,
			m.getPowerBase() + m.getCpu());
		b++;
	    }
	    for (Machine m : machines) {
		model.addConstraints(Choco.eq(
			pmEnergy[idx],
			Choco.plus(
				pmCpu.loads[idx],
				Choco.min(m.getPowerBase(), Choco.mult(
					m.getPowerBase(), pmCpu.loads[idx])))));
		idx++;
	    }
	} else if (methodUsed.equals("SECOND")) {
	    for (Machine m : machines) {
		pmEnergy[b] = Choco.makeIntVar("pmEnergy_" + m.getName(), 0,
			m.getPowerMax());
		b++;
	    }
	    for (Machine m : machines) {
		// Q3
		// Coder la formule presentee au tablea
		// A remplir : environ 6 lignes
		// pmEnergy[idx] = (m.getPowerMax() - m.getPowerMin()) * pmCpu.loads[idx] / m.getCpu() + min(m.getPowerMin(), pmCpu.loads[idx] * m.getPowerMin())
		model.addConstraints(Choco.eq(
			pmEnergy[idx], 
			Choco.plus(
        			Choco.div(
        				Choco.mult(
        					m.getPowerMax() - m.getPowerMin(), 
        					pmCpu.loads[idx]), 
        				m.getCpu()),
        			Choco.min(
        				m.getPowerMin(),
        				Choco.mult(
        					pmCpu.loads[idx], 
        					m.getPowerMin()
        				)
        			)
        		)
        	));
		idx++;
	    }
	} else {
	    throw new UnsupportedOperationException(
		    "Please choose between Type.FIRST or Type.SECOND for Algo.NRJ using.");
	}

	model.addConstraints(Choco.eq(Choco.sum(pmEnergy), totalEnergy));

	if (spreadConstraint) {
	    List<Integer> indices = new ArrayList<Integer>();
	    for (int i = 0; i < vmIdMemory.length; i++) {
		for (VM vm : config.getEnemies()) {
		    if (vm.getId() == vmIdMemory[i]) {
			indices.add(i);
		    }
		}
	    }
	    if (indices.size() > 0) {

		// Q4 : Coder le spread
		// indice : recuperer les PM ou sont executees les VM
		// puis utiliser allDifferent sur ces PM

		IntegerVariable[] ivToSpread = new IntegerVariable[indices
			.size()];
		idx = 0;
		for (int elt : indices) {
		    // A remplir : une ligne
		    // ivToSpread[idx] = pmEnergy[elt];
		    idx++;
		}
		// A remplir : une ligne
		// model.addConstraints(Choco.allDifferent(ivToSpread));
	    }
	}

	ChocoLogging.toVerbose();
	Solver solver = new CPSolver();
	solver.read(model);
	solver.setTimeLimit(20000);

	try {
	    int c = 0;
	    for (Machine m : machines) {
		solver.getVar(pmEnergy[c]).removeInterval(1, m.getPowerMin(),
			null, false);
		c++;
	    }
	} catch (Exception c) {
	    c.printStackTrace();
	}
	solver.solve();
	ChocoLogging.flushLogs();

	// Conversion into my model
	for (int i = 0; i < virtualMachines.size(); i++) {
	    int niemeVMofSorterdList = i;
	    int vmId = vmIdMemory[niemeVMofSorterdList];
	    for (VM v : virtualMachines) {
		if (v.getId() == vmId) {
		    machines.get(solver.getVar(pmMemory.bins[i]).getVal())
			    .addVM(v);
		}
	    }
	}
	// initialize power consumption
	for (IntegerVariable iv : pmEnergy) {
	    for (Machine m : machines) {
		if (solver.getVar(iv).getName().contains(m.getName())) {
		    m.setComputePower(solver.getVar(iv).getVal());
		}
	    }
	}
    }

    /**
     * 
     * @param vmSize
     * @param vmId
     */
    public void bubbleSort(int[] vmSize, int[] vmId) {
	boolean swapped = true;
	int j = 0;
	int tmp;
	while (swapped) {
	    swapped = false;
	    j++;
	    for (int i = 0; i < vmSize.length - j; i++) {
		if (vmSize[i] < vmSize[i + 1]) {
		    tmp = vmSize[i];
		    vmSize[i] = vmSize[i + 1];
		    vmSize[i + 1] = tmp;

		    tmp = vmId[i];
		    vmId[i] = vmId[i + 1];
		    vmId[i + 1] = tmp;

		    swapped = true;
		}
	    }
	}
    }
}