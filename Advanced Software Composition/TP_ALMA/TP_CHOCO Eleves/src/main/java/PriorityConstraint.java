import java.util.List;

import choco.Choco;
import choco.cp.model.CPModel;
import choco.cp.solver.CPSolver;
import choco.kernel.common.logging.ChocoLogging;
import choco.kernel.model.Model;
import choco.kernel.model.variables.integer.IntegerConstantVariable;
import choco.kernel.model.variables.integer.IntegerVariable;
import choco.kernel.solver.Solver;
import choco.kernel.solver.variables.integer.IntDomainVar;

/**
 *
 */
@SuppressWarnings("unused")
public class PriorityConstraint {

    private Model model = new CPModel();
    private PhysVirtConfiguration config;
    private List<VM> virtualMachines;

    private List<Machine> machines;

    public PriorityConstraint(PhysVirtConfiguration conf) {
	config = conf;
	machines = config.getMachines();
	virtualMachines = config.getVms();
    }

    public void newModel(int sumOnOff) {

	IntegerVariable[] vmState = new IntegerVariable[virtualMachines.size()];
	IntegerVariable[] vmPrio = new IntegerVariable[virtualMachines.size()];
	IntegerVariable totalPriority = Choco.makeIntVar("totalPriority", 0,
		1000, "cp:objective");

	int idx = 0;
	for (VM vm : virtualMachines) {
	    /*
	     * Definir une variable priority (de type constant) qui est egale a
	     * la valeur dans vm.priority
	     */
	    // A remplir : 1 ligne
	    IntegerConstantVariable priority = Choco.constant(vm.priority);

	    vmState[idx] = Choco.makeIntVar(vm.getName(), 0, 1);
	    vmPrio[idx] = Choco.makeIntVar("vmPrio" + idx, 0, 10);

	    /*
	     * definir la contrainte qui pour affecte a vmPrio[idx] la
	     * multiplication entre vmSate et priority
	     */
	    // A remplir : 1 ligne
	    model.addConstraints(Choco.eq(vmPrio[idx],
		    Choco.mult(priority, vmState[idx])));
	    idx++;
	}

	/*
	 * definir la contrainte qui fait en sorte que le nombre max de VM
	 * active soit inferieur ou egale a sumOnOff passe en parametre
	 */
	// A remplir : 1 ligne
	/*
	 * definir la contrainte qui affecte a totalPriority la somme des
	 * priorites calculees dans vmPrio[idx]
	 */
	// A remplir : 1 ligne
	model.addConstraint(Choco.leq(Choco.sum(vmState), sumOnOff));
	model.addConstraint(Choco.eq(totalPriority, Choco.sum(vmPrio)));

	ChocoLogging.toVerbose();
	Solver solver = new CPSolver();
	solver.read(model);
	solver.setTimeLimit(20000);

	solver.maximize(true);
	// solver.solve();
	ChocoLogging.flushLogs();

	for (VM vm : virtualMachines) {
	    for (IntegerVariable iv : vmState) {
		IntDomainVar tmp = solver.getVar(iv);
		if (tmp.getVal() == 1 && vm.getName().equals(tmp.getName())) {
		    vm.setOnOff(1);
		}
	    }
	}
    }
}
