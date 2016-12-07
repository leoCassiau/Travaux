/**
 * 
 *
 */
public abstract class PhysVirtNode {
	protected int memory;
	protected int cpu;
	protected int id;
	protected int powerBase;
	//	protected int powerCoef;

	protected String name;

	/**
	 * Node constructor
	 * @param n, the Node name
	 */
	public PhysVirtNode(String n) {
		name = n;
		setMemory();
		setCpu();
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	// Cpu
	protected abstract void setCpu();

	public int getCpu() {
		return cpu / 100;
	}

	// Memory
	protected abstract void setMemory();

	public void setId(int i) {
		id = i;
	}

	public int getMemory() {
		return memory / 512;
	}

}
