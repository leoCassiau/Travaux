import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Machine extends PhysVirtNode {

	private int load = 0;
	private int powerMax = 0;
	private int powerBase = 0;
	private int powerMin = 0;
	private int computePower = 0;
	private List<VM> vms = new ArrayList<VM>();

	public Machine(String n, int i) {
		super(n);
		id = i;
		powerMin = 150;
		powerMax = 200;
		powerBase = powerMin + (int) Math.ceil(memory / 100);
	}


	public Machine(String n, int m, int c, int i) {
		super(n);
		cpu = c;
		memory = m;
		id = i;
		powerMin = 150;
		powerMax = 200;
		powerBase = 500 + (int) Math.ceil(memory / 100);
	}

	public List<VM> getVMs() {
		return vms;
	}

	public List<VM> getVmsOn(){
		List<VM> tmp = new ArrayList<VM>();
		for(VM vm : vms){
			if(vm.onOff == 1){
				tmp.add(vm);
			}
		}
		return tmp;
	}

	/**
	 * Add a vm into the list and update the cpu load.
	 * 
	 * @param v
	 *            , the vm to add.
	 */
	public void addVM(VM v) {
		load += v.getCpu();
		vms.add(v);
		v.setHost(this);
	}

	/**
	 * Remove the vm and update the cpu load.
	 * 
	 * @param v, the VM to remove.
	 */
	public void removeVM(VM v) {
		load -= v.getCpu();
		vms.remove(v);
		v.setHost(null);
	}

	public void removeAllVmsOff(){
		List<VM> vmsToRemove = new ArrayList<VM>();
		for(VM vm : vms){
			if(vm.getOnOff() == 0){
				vmsToRemove.add(vm);
			}
		}
		for(VM vm : vmsToRemove){
			removeVM(vm);
		}
	}

	@Override
	public String toString() {
		return name + "(" + getCpu() + "," + getMemory() + ")" + vms;
	}

	public String extendedString() {
		String result = "";
		result += name + "[" + getMemory() + "]<<";
		for (VM v : vms) {
			result += v + "[" + v.getMemory() + "]" + "[" + v.getCpu() + "]";
		}
		return result + ">> ";
	}

	// Memory (4, 8, 16 Gb)
	@Override
	public void setMemory() {
		int[] mem = { 4096, 8192, 16384 };
		memory = mem[new Random().nextInt(mem.length)];
	}

	public int getUsedMemory() {
		int cons = 0;
		for (VM v : vms) {
			cons += v.getMemory();
		}
		return cons;
	}

	public int getFreeMemory() {
		int cons = 0;
		for (VM v : vms) {
			cons += v.getMemory();
		}
		return getMemory() - cons;
	}

	// Cpu ( 4, 8, 16 cpus)
	@Override
	public void setCpu() {
		int[] cpu = { 400, 800, 1600 };
		this.cpu = cpu[new Random().nextInt(cpu.length)];
	}

	public int getUsedCpu() {
		int cons = 0;
		for (VM v : vms) {
			cons += v.getCpu();
		}
		return cons;
	}

	public int getFreeCpu() {
		int cons = 0;
		for (VM v : vms) {
			cons += v.getCpu();
		}
		return getCpu() - cons;
	}

	/**
	 * Get the PM power consumption, for the FIRST METHOD
	 * @return the power consumption according to the cpu used by the machine.
	 */
	public int getPower() {
		if (getUsedCpu() == 0) {
			return 0;
		} else {
			return powerBase + getUsedCpu();
		}
	}

	/**
	 * Get the PM power consumption, for the SECOND METHOD
	 * @return the power consumption according to the cpu used by the machine.
	 */
	public int getPower2() {
		if (getUsedCpu() == 0) {
			return 0;
		} else {
			int energy  = (powerMax - powerMin) * (getUsedCpu()*100 / getCpu()) / 100 + powerMin;
			setComputePower(energy);
			return energy ;
		}
	}

	public int getPowerBase(){
		return powerBase;
	}

	/**
	 * Clear the vms list and initialize the cpu load to 0.
	 */
	public void clear() {
		vms.clear();
		load = 0;
	}

	public void setPowerMin(int power){
		powerMin = power;
	}

	public void setPowerMax(int power){
		powerMax = power;
	}

	public int getPowerMax(){
		return powerMax;
	}

	public int getPowerMin(){
		return powerMin;
	}

	public int getComputePower() {
		return computePower;
	}

	public void setComputePower(int powerTotal) {
		computePower = powerTotal;
	}
}
