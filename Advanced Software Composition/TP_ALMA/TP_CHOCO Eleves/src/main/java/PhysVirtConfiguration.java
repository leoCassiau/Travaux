import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

/**
 * 
 */
public class PhysVirtConfiguration implements Cloneable {

	private List<Machine> machines = new ArrayList<Machine>();
	private List<VM> virtualMachines = new ArrayList<VM>();
	private HashSet<VM> vmsIgnored = new HashSet<VM>();
	private List<VM> enemies = new ArrayList<VM>();
	private String algo = "";
	private String type = "";

	/**
	 * Make the configuration.
	 * 
	 * @param nbMachines
	 * @param nbVms
	 * @throws ConfigurationException
	 */
	public void makeConfiguration(String algo, String type, int nbMachines, int nbVms)
	throws ConfigurationException {

		// Save algo and type used
		this.algo = algo;
		this.type = type;

		// Remove all elements of the grid
		clearAll();
		// Create 'nbMachines' machines
		while (nbMachines > 0) {
			nbMachines--;
			Machine m = new Machine("machine-" + nbMachines, nbMachines);
			machines.add(m);
		}

		// Sort machines in increasing order
		machines = increasingSort(machines);

		// Create 'nbVms' virtual machines
		while (nbVms > 0) {
			nbVms--;
			VM v = new VM("vm" + nbVms, nbVms);
			virtualMachines.add(v);
		}
		nbVms = virtualMachines.size();

		// Sort virtual machines in decreasing order
		virtualMachines = decreasingSort(virtualMachines);

		// Place vms on machines
		boolean noHost = false;
		for (int ivm = 0; ivm < nbVms; ivm++) {
			noHost = true;
			VM v = virtualMachines.get(ivm);
			for (int im = 0; noHost && im < machines.size(); im++) {
				Machine m = machines.get(im);
				if (m.getFreeMemory() >= v.getMemory()
						&& m.getFreeCpu() >= v.getCpu()) {
					m.addVM(v);
					usedCpuIncreasingSort(machines, m);
					noHost = false;
				}
			}
			if (noHost) {
				vmsIgnored.add(v);
			}
		}
		if (!vmsIgnored.isEmpty()) {
			virtualMachines.removeAll(vmsIgnored);
			throw new ConfigurationException("Too many virtual machines!");
		} else {
			Problem.log1("## Machines");
			for (Machine m : machines) {
				Problem.log1(m.getName() + " " + m.getMemory() + " "
						+ m.getCpu() + " " + m.getId());
			}
			Problem.log1("## Virtual machines");
			for (VM v : virtualMachines) {
				Problem.log1(v.getName() + " " + v.getMemory() + " "
						+ v.getCpu() + " " + v.getId());
			}
		}
	}

	/**
	 * Sort the list according to CPU load.
	 * 
	 * @param l
	 *            , the machine list.
	 * @return the new list sorted.
	 */
	private List<Machine> increasingSort(List<Machine> l) {
		List<Machine> sorted = new LinkedList<Machine>();
		sorted.add(l.remove(0));
		for (Machine m : l) {
			int i;
			for (i = 0; i < sorted.size()
			&& m.getCpu() > sorted.get(i).getCpu(); i++) {
				;
			}
			if (i < sorted.size()) {
				sorted.add(i, m);
			} else {
				sorted.add(m);
			}
		}
		return sorted;
	}

	private List<VM> decreasingSort(List<VM> l) {
		List<VM> sorted = new LinkedList<VM>();
		for (VM v : l) {
			int i;
			for (i = 0; i < sorted.size()
			&& v.getCpu() <= sorted.get(i).getCpu(); i++) {
				;
			}
			if (i < sorted.size()) {
				sorted.add(i, v);
			} else {
				sorted.add(v);
			}
		}
		l.clear();
		l.addAll(sorted);
		return sorted;
	}

	private List<Machine> usedCpuIncreasingSort(List<Machine> l, Machine m) {
		int index = l.indexOf(m);
		if (index + 1 >= l.size()) {
			return l;
		}
		l.remove(index);
		int i = index;
		double cpun = m.getUsedCpu();
		double cpui = l.get(i).getUsedCpu();
		while (i < l.size() && cpun > cpui) {
			i++;
			if (i < l.size()) {
				cpui = l.get(i).getUsedCpu();
			}
		}
		if (i < l.size()) {
			l.add(i, m);
		} else {
			l.add(m);
		}
		return l;
	}

	public List<VM> getVms() {
		return virtualMachines;
	}

	/**
	 * @return list of vms to be on different PM
	 */
	public List<VM> getEnemies() {
		return enemies;
	}

	public List<Machine> getMachines() {
		return machines;
	}

	public void clearAll() {
		virtualMachines.clear();
		machines.clear();
	}

	public void clearMachines() {
		for (Machine m : machines) {
			m.getVMs().clear();
		}
		machines = increasingSort(machines);
	}

	public int initPower(String typeOfAlgo) {
		int energy = 0;
		if(typeOfAlgo.equals("SECOND")){
			for(Machine m : machines){
				energy += m.getPower2();
			}
		}else{
			for (Machine m : machines) {
				energy += m.getPower();
			}
		}
		return energy;
	}

	public boolean isSatisfied() {
		boolean resp = true;
		for (Machine m : machines) {
			resp = resp & m.getUsedCpu() <= m.getCpu();
			resp = resp & m.getUsedMemory() <= m.getMemory();
		}
		return resp;
	}

	public String machines() {
		String res = "";
		for (Machine m : machines) {
			res += m.getName() + "(" + m.getMemory() + "," + m.getCpu() + ")\n";
		}
		return res;
	}

	public void setMachines(List<Machine> l) {
		machines = l;
	}

	public String vms() {
		String res = "";
		for (VM v : virtualMachines) {
			res += v.getName() + "(" + v.getMemory() + "," + v.getCpu() + ")\n";
		}
		return res;
	}

	public void addEnemies(VM... enemy) {
		for (VM vm : enemy) {
			enemies.add(vm);
		}
		//		System.out.println("Enemies: ");
		//		System.out.println(enemies);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	public String show(boolean bool) {
		if (algo.equals("PRIORITY")) {
			String res = "\nName (cpuUsed/totalcpu,memoryused/totalmemory) - list VMs (cpuUsed,memoryUsed,on/off,priority) \n";
			for(VM vm : virtualMachines){
				vm.setShowPriorityBoolean(true);
			}
			for (Machine m : machines) {
				if (bool) {
					m.removeAllVmsOff();
				}
				res += m.getName() + " (" + m.getUsedCpu() + "/" + m.getCpu()
				+ "," + m.getUsedMemory() + "/" + m.getMemory() + ") "
				+ " : " + (bool ? m.getVmsOn() : m.getVMs()) + "\n";
			}
			return res;
		}
		if (algo.equals("NRJ") && type.equals("FIRST")) {
			int energy = 0;
			String energyDebug = "";
			String res = "\nName (cpuUsed/totalcpu,memoryused/totalmemory) - list VMs\n";
			for (Machine m : machines) {
				res += m.getName() + " (" + m.getUsedCpu() + "/" + m.getCpu()
				+ "," + m.getUsedMemory() + "/" + m.getMemory() + ") "
				+ m.getPowerBase() + " : " + m.getVMs() + "\n";

				energy += m.getPower();
				energyDebug += " - " + String.valueOf(m.getPower());
			}
			res += "\n Machine Energy : " + energyDebug;
			res += "\n Energy : " + energy;
			return res;
		}
		if (algo.equals("NRJ") && type.equals("SECOND")) {
			int energy = 0;
			String energyDebug = "";
			String res = "\nName (cpuUsed/totalcpu,memoryused/totalmemory) - list VMs\n";
			for (Machine m : machines) {
				res += m.getName() + " (" + m.getUsedCpu() + "/" + m.getCpu()
				+ "," + m.getUsedMemory() + "/" + m.getMemory() + ") "
				+ " : " + m.getVMs() + "\n";

				energy += m.getComputePower();
				energyDebug += " - " + String.valueOf(m.getComputePower());
			}
			res += "\n Machine Energy : " + energyDebug;
			res += "\n Energy : " + energy;
			return res;
		}

		return "";
	}

	public String print(boolean cpu) {
		String res = "";
		int occupation = 0;
		if (cpu) {
			res += "\n######## Cpu Management ########\n";
		} else {
			res += "\n###### Memory Management #######\n";
		}
		for (Machine m : machines) {
			res += m.getName() + ": ";
			if (cpu) {
				occupation += m.getUsedCpu() * 100 / m.getCpu();
				for (VM v : m.getVMs()) {
					res += v.getCpu() + " ";
				}
				res += "(" + m.getCpu() + ")\n";
			} else {
				occupation += m.getUsedMemory() * 100 / m.getMemory();
				for (VM v : m.getVMs()) {
					res += v.getMemory() + " ";
				}
				res += "(" + m.getMemory() + ")\n";
			}
		}
		res += "Occupation rate: " + occupation / machines.size() + "%";
		return res;
	}

	public int getComputePower() {
		int energy = 0;
		for(Machine m : machines){
			energy += m.getComputePower();
		}
		return energy;
	}
}
