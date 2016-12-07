import java.util.Random;

/**
 * 
 */
public class VM extends PhysVirtNode {

	private Machine host;
	public int priority;
	public int onOff;
	private boolean showPriority = false;


	public VM(String n, int i) {
		super(n);
		id = i;
		//0 or 1
		priority = (int)(Math.random()*10) + 1;
	}

	public VM(String n, int m, int c, int i) {
		super(n);
		id = i;
		cpu = c;
		memory = m;
		priority = (int)(Math.random()*10);
	}

	// Host
	public void setHost(Machine m) {
		host = m;
	}

	public Machine getHost() {
		return host;
	}

	public int getPriority(){
		return priority;
	}

	public boolean showPriority(){
		return showPriority;
	}

	public void setShowPriorityBoolean(boolean bool){
		showPriority = bool;
	}

	public int getOnOff(){
		return onOff;
	}

	public void setOnOff(int var){
		onOff = var;
	}

	public void migrate(Machine m) {
		host.removeVM(this);
		m.addVM(this);
	}

	// Memory
	@Override
	public void setMemory() {
		int[] mem = { 512, 1024, 2048 };
		memory = mem[new Random().nextInt(3)];
	}

	@Override
	public String toString() {
		return name + "(" + getCpu() + "," + getMemory() + (showPriority ? "," + onOff + "," + getPriority() : "") + ")";
	}

	// Cpu
	@Override
	public void setCpu() {
		int[] cpu = { 100, 200, 300 };
		this.cpu = cpu[new Random().nextInt(3)];
	}
}
