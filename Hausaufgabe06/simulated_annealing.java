import java.lang.Math;

public class simulated_annealing {
    public static double e_x (double x) {
        double result = Math.exp(-0.5 * (Math.pow(( x - 0.2 ) / 0.15, 2.0)))
                + 2 * Math.exp(-0.5 * Math.pow((x - 0.7) / 0.1, 2));
        return result;
    }

    public static double p_xndxn_xn (double dxn, double xn, double Tn) {
        double result = 1;
        if (e_x(xn + dxn) < e_x(xn)) {
            result = Math.exp(- Math.abs((e_x(xn + dxn) - e_x(xn))) / Tn);
        }
        return result;
    }

    public static double x_nplus1 (double dxn, double xn, boolean isAccepted) {
        double result = xn;
        if (isAccepted) {
            result = xn + dxn;
        }
        return result;
    }

    public static void print(double[] asdf) {
        for (int i = 0; i < asdf.length; i++) {
            System.out.print(asdf[i] + "\t");
        }
        System.out.println("");
    }

    public static void print(String as) {
        System.out.print(as);
    }

    public static void main (String[] args) {
        //xn                            0       1           2           3           4           5           (6)
        double[] XN = new double[]      {0.85,  0.75,       1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337};
        double[] DXN = new double[]     {-0.1,  -0.15,      -0.5,       0.1,        0.2,        0.05,       1337.1337};
        double[] EXN = new double[]     {0.65,  1.77,       1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337};
        double[] EXNDXN = new double[]  {1.77,  1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337};
        double[] TN = new double[]      {1.6,   0.8,        0.4,        0.2,        0.1,        0.05,       1337.1337};
        double[] PXNDXNXN = new double[]{1,     1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337,  1337.1337};
        double[] RN = new double[]      {0.3,   0.7,        0.01,       0.1,        0.8,        0.6,        1337.1337};

        boolean isAccepted = false;
        for (int i = 1; i < 100; i++) {
          if (i < 6) {
            EXN[i] = e_x(XN[i]);
            EXNDXN[i] = e_x(XN[i] + DXN[i]);
            PXNDXNXN[i] = p_xndxn_xn(DXN[i], XN[i], TN[i]);
            isAccepted = PXNDXNXN[i] > RN[i];
            XN[i+1] = x_nplus1(DXN[i], XN[i], isAccepted);
          }

        }


        print("XN\t"); print(XN);
        print("EXN\t"); print(EXN);
        print("EXNDXN\t"); print(EXNDXN);
        print("PXNDXNXN\t"); print(PXNDXNXN);
    }
}
