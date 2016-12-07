import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.FileAppender;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

/**
 *
 */
public class Problem {

    public static final Logger logger1 = Logger.getLogger("conf");
    public static final Logger logger2 = Logger.getLogger("exp");
    public static final String logDir = "logs/";
    public static boolean log = true;

    public enum Algo {
	NRJ, PRIORITY
    };

    public enum Type {
	FIRST, SECOND
    };

    public enum vmsToSpread {
	vm0, vm1, vm2
    };

    private static final boolean SPREAD = true;

    public static void main(String[] args) throws CloneNotSupportedException {

	// Parameters for the configuration
	Algo algo = Algo.NRJ;
	Type type = Type.SECOND; // 2 methods if Algo.NRJ chosen

	int nbMachines = 10;
	int nbVms = 15;
	int sumOnOff = 50;
	int nbTry = 1;
	int maxOfExp = 1;
	// /////////////////////////////////////////////

	int indexNBofExp;
	int configPower;
	List<Long> times = new ArrayList<Long>();
	long t0, t1 = System.currentTimeMillis();

	for (indexNBofExp = 1; indexNBofExp <= maxOfExp; indexNBofExp++) {
	    try {
		configLogger(nbVms, nbMachines, algo.toString());
	    } catch (IOException e) {
		e.printStackTrace();
	    }

	    log2("\n\n#################################");
	    log2("######### Experiments " + indexNBofExp + " #########");
	    log2("#################################");

	    PhysVirtConfiguration conf = new PhysVirtConfiguration();
	    try {
		conf.makeConfiguration(algo.toString(), type.toString(),
			nbMachines, nbVms);
	    } catch (ConfigurationException e1) {
		e1.printStackTrace();
	    }

	    for (int i = 0; i < nbTry; i++) {

		if (i != 0) {
		    log2("\n\n#################################");
		    log2("######### Loops " + (i + 1) + " ###############");
		    log2("#################################");
		}

		switch (algo) {
		case NRJ:
		    if (i == 0) {
			configPower = conf.initPower(type.toString());
			log2("\nSolution without constraint :\n ");
			log2(conf.print(false));
			log2(conf.print(true));
			log2(conf.show(false));
			log2("\n\nWelcome to the constraint world ...");
			log2("\n\n#################################");
			log2("######### Loops " + (i + 1) + " ###############");
			log2("#################################");
			if (SPREAD) {
			    // initialize enemies
			    for (vmsToSpread vts : vmsToSpread.values()) {
				for (VM vm : conf.getVms()) {
				    if (vm.getName().equals(vts.name())) {
					conf.addEnemies(vm);
				    }
				}
			    }
			}
		    } else {
			configPower = conf.getComputePower();
		    }
		    conf.clearMachines();
		    NRJConstraint nconstraint = new NRJConstraint(conf, SPREAD);
		    t0 = System.currentTimeMillis();
		    nconstraint.newModel(configPower, type.toString());
		    t1 = System.currentTimeMillis();
		    log2(conf.print(false));
		    log2(conf.print(true));
		    log2(conf.show(false));
		    if (conf.isSatisfied()) {
			System.out.println("\nSatisfied");
		    } else {
			System.err.println("\nNot satisfied");
		    }
		    times.add(t1 - t0);
		    break;

		case PRIORITY:
		    PriorityConstraint pconstraint = new PriorityConstraint(
			    conf);
		    if (i == 0) {
			log2("\nSolution without constraint :\n ");
			log2(conf.show(false));
			log2("\n\nWelcome to the constraint world ... ");
			log2("\n\n#################################");
			log2("######### Loops " + (i + 1) + " ###############");
			log2("#################################");
		    }
		    t0 = System.currentTimeMillis();
		    pconstraint.newModel(sumOnOff);
		    t1 = System.currentTimeMillis();
		    log2(conf.show(true));
		    times.add(t1 - t0);
		    break;
		default:
		    break;
		}

		log2("\nComputation time: " + times.get(times.size() - 1));
		// Solving times
		if (times.size() > 0) {
		    log2("Solving times: " + times);
		    long mean = 0;
		    for (Long l : times) {
			mean += l;
		    }
		    log2("Mean: " + mean / times.size());
		}
	    }
	}
    }

    public static void configLogger(int nbVms, int nbMachines, String algo)
	    throws IOException {
	Date d = new Date();
	FileAppender rfa;
	rfa = new FileAppender(new PatternLayout(), logDir + nbMachines + "x"
		+ nbVms + d + ".config");
	logger1.addAppender(rfa);
	rfa = new FileAppender(new PatternLayout(), logDir + nbMachines + "x"
		+ nbVms + d + "_" + algo + ".exp");
	logger2.addAppender(rfa);
    }

    public static void log1(String mess) {
	if (log) {
	    logger1.info(mess);
	}
    }

    private static void log2(String mess) {
	System.out.println(mess);
	if (log) {
	    logger2.info(mess);
	}
    }

}
