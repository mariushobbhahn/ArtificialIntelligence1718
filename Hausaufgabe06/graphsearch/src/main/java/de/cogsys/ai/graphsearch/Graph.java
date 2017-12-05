package de.cogsys.ai.graphsearch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.lang.Math;

public class Graph {

    public static class Point {

        double x;
        double y;

        public Point (double x, double y) {
            this.x = x;
            this.y = y;
        }
    }


    private static Map<String, Map<String, Integer>> distances;

    private static Map<String, Point> coordinates;

    private static Map<String, Double> heuristic;

    private static String[] pathTaken;

    private static double distanceTravelled = 0;


    public static List<String> expand (String city) {
        return new ArrayList<String>(distances.get(city).keySet());
    }

    public static double distance (String city1, String city2) {
        return distances.get(city1).get(city2);
    }

    public static void initGraph () {
        distances = new HashMap<String, Map<String, Integer>>();
        distances.put("aachen", new HashMap<String, Integer>());
        distances.get("aachen").put("essen", 123);
        distances.get("aachen").put("koblenz", 145);
        distances.get("aachen").put("koeln", 65);
        distances.put("augsburg", new HashMap<String, Integer>());
        distances.get("augsburg").put("garmisch-part.", 117);
        distances.get("augsburg").put("muenchen", 81);
        distances.get("augsburg").put("stuttgart", 149);
        distances.get("augsburg").put("ulm", 83);
        distances.put("bayreuth", new HashMap<String, Integer>());
        distances.get("bayreuth").put("nuernberg", 74);
        distances.get("bayreuth").put("wuerzburg", 147);
        distances.put("berlin", new HashMap<String, Integer>());
        distances.get("berlin").put("cottbus", 125);
        distances.get("berlin").put("frankfurt/oder", 91);
        distances.get("berlin").put("magdeburg", 131);
        distances.get("berlin").put("neubrandenburg", 130);
        distances.put("bremen", new HashMap<String, Integer>());
        distances.get("bremen").put("hamburg", 110);
        distances.get("bremen").put("hannover", 118);
        distances.get("bremen").put("osnabrueck", 120);
        distances.get("bremen").put("wilhelmshaven", 110);
        distances.put("chemnitz", new HashMap<String, Integer>());
        distances.get("chemnitz").put("erfurt", 160);
        distances.get("chemnitz").put("leipzig", 90);
        distances.put("cottbus", new HashMap<String, Integer>());
        distances.get("cottbus").put("berlin", 125);
        distances.get("cottbus").put("dresden", 138);
        distances.get("cottbus").put("frankfurt/oder", 119);
        distances.put("dresden", new HashMap<String, Integer>());
        distances.get("dresden").put("cottbus", 138);
        distances.get("dresden").put("leipzig", 140);
        distances.put("erfurt", new HashMap<String, Integer>());
        distances.get("erfurt").put("kassel", 135);
        distances.get("erfurt").put("chemnitz", 160);
        distances.put("essen", new HashMap<String, Integer>());
        distances.get("essen").put("aachen", 123);
        distances.get("essen").put("koeln", 75);
        distances.get("essen").put("muenster", 87);
        distances.get("essen").put("osnabrueck", 135);
        distances.put("frankfurt/main", new HashMap<String, Integer>());
        distances.get("frankfurt/main").put("fulda", 95);
        distances.get("frankfurt/main").put("karlsruhe", 135);
        distances.get("frankfurt/main").put("koblenz", 125);
        distances.get("frankfurt/main").put("mannheim", 106);
        distances.get("frankfurt/main").put("wuerzburg", 130);
        distances.put("frankfurt/oder", new HashMap<String, Integer>());
        distances.get("frankfurt/oder").put("berlin", 91);
        distances.get("frankfurt/oder").put("cottbus", 119);
        distances.put("freiburg", new HashMap<String, Integer>());
        distances.get("freiburg").put("karlsruhe", 130);
        distances.put("fulda", new HashMap<String, Integer>());
        distances.get("fulda").put("frankfurt/main", 95);
        distances.get("fulda").put("kassel", 105);
        distances.get("fulda").put("wuerzburg", 100);
        distances.put("garmisch-part.", new HashMap<String, Integer>());
        distances.get("garmisch-part.").put("augsburg", 117);
        distances.get("garmisch-part.").put("muenchen", 89);
        distances.put("hamburg", new HashMap<String, Integer>());
        distances.get("hamburg").put("bremen", 110);
        distances.get("hamburg").put("kiel", 90);
        distances.get("hamburg").put("rostock", 150);
        distances.get("hamburg").put("schwerin", 120);
        distances.put("hannover", new HashMap<String, Integer>());
        distances.get("hannover").put("bremen", 118);
        distances.get("hannover").put("magdeburg", 136);
        distances.get("hannover").put("osnabrueck", 135);
        distances.put("karlsruhe", new HashMap<String, Integer>());
        distances.get("karlsruhe").put("frankfurt/main", 135);
        distances.get("karlsruhe").put("freiburg", 130);
        distances.get("karlsruhe").put("mannheim", 58);
        distances.get("karlsruhe").put("stuttgart", 81);
        distances.put("kassel", new HashMap<String, Integer>());
        distances.get("kassel").put("erfurt", 135);
        distances.get("kassel").put("fulda", 105);
        distances.put("kiel", new HashMap<String, Integer>());
        distances.get("kiel").put("hamburg", 90);
        distances.get("kiel").put("schwerin", 139);
        distances.put("koblenz", new HashMap<String, Integer>());
        distances.get("koblenz").put("aachen", 145);
        distances.get("koblenz").put("frankfurt/main", 125);
        distances.get("koblenz").put("koeln", 110);
        distances.get("koblenz").put("mannheim", 145);
        distances.get("koblenz").put("trier", 128);
        distances.put("koeln", new HashMap<String, Integer>());
        distances.get("koeln").put("aachen", 65);
        distances.get("koeln").put("essen", 75);
        distances.get("koeln").put("koblenz", 110);
        distances.get("koeln").put("muenster", 144);
        distances.put("leipzig", new HashMap<String, Integer>());
        distances.get("leipzig").put("dresden", 140);
        distances.get("leipzig").put("magdeburg", 108);
        distances.get("leipzig").put("chemnitz", 90);
        distances.put("lindau", new HashMap<String, Integer>());
        distances.get("lindau").put("ulm", 126);
        distances.put("magdeburg", new HashMap<String, Integer>());
        distances.get("magdeburg").put("berlin", 131);
        distances.get("magdeburg").put("hannover", 136);
        distances.get("magdeburg").put("leipzig", 108);
        distances.put("mannheim", new HashMap<String, Integer>());
        distances.get("mannheim").put("frankfurt/main", 106);
        distances.get("mannheim").put("karlsruhe", 58);
        distances.get("mannheim").put("koblenz", 145);
        distances.get("mannheim").put("saarbruecken", 117);
        distances.get("mannheim").put("stuttgart", 138);
        distances.get("mannheim").put("trier", 146);
        distances.put("muenchen", new HashMap<String, Integer>());
        distances.get("muenchen").put("augsburg", 81);
        distances.get("muenchen").put("garmisch-part.", 89);
        distances.get("muenchen").put("regensburg", 106);
        distances.get("muenchen").put("ulm", 124);
        distances.put("muenster", new HashMap<String, Integer>());
        distances.get("muenster").put("essen", 87);
        distances.get("muenster").put("koeln", 144);
        distances.get("muenster").put("osnabrueck", 60);
        distances.put("neubrandenburg", new HashMap<String, Integer>());
        distances.get("neubrandenburg").put("berlin", 130);
        distances.get("neubrandenburg").put("rostock", 103);
        distances.put("nuernberg", new HashMap<String, Integer>());
        distances.get("nuernberg").put("bayreuth", 74);
        distances.get("nuernberg").put("regensburg", 105);
        distances.get("nuernberg").put("wuerzburg", 108);
        distances.put("osnabrueck", new HashMap<String, Integer>());
        distances.get("osnabrueck").put("bremen", 120);
        distances.get("osnabrueck").put("essen", 135);
        distances.get("osnabrueck").put("hannover", 135);
        distances.get("osnabrueck").put("muenster", 60);
        distances.put("passau", new HashMap<String, Integer>());
        distances.get("passau").put("regensburg", 128);
        distances.put("regensburg", new HashMap<String, Integer>());
        distances.get("regensburg").put("muenchen", 106);
        distances.get("regensburg").put("nuernberg", 105);
        distances.get("regensburg").put("passau", 128);
        distances.put("rostock", new HashMap<String, Integer>());
        distances.get("rostock").put("hamburg", 150);
        distances.get("rostock").put("neubrandenburg", 103);
        distances.get("rostock").put("schwerin", 90);
        distances.put("saarbruecken", new HashMap<String, Integer>());
        distances.get("saarbruecken").put("mannheim", 117);
        distances.get("saarbruecken").put("trier", 103);
        distances.put("schwerin", new HashMap<String, Integer>());
        distances.get("schwerin").put("hamburg", 120);
        distances.get("schwerin").put("kiel", 139);
        distances.get("schwerin").put("rostock", 90);
        distances.put("stuttgart", new HashMap<String, Integer>());
        distances.get("stuttgart").put("augsburg", 149);
        distances.get("stuttgart").put("karlsruhe", 81);
        distances.get("stuttgart").put("mannheim", 138);
        distances.get("stuttgart").put("ulm", 100);
        distances.put("trier", new HashMap<String, Integer>());
        distances.get("trier").put("koblenz", 128);
        distances.get("trier").put("mannheim", 146);
        distances.get("trier").put("saarbruecken", 103);
        distances.put("ulm", new HashMap<String, Integer>());
        distances.get("ulm").put("augsburg", 83);
        distances.get("ulm").put("lindau", 126);
        distances.get("ulm").put("muenchen", 124);
        distances.get("ulm").put("stuttgart", 100);
        distances.put("wilhelmshaven", new HashMap<String, Integer>());
        distances.get("wilhelmshaven").put("bremen", 110);
        distances.put("wuerzburg", new HashMap<String, Integer>());
        distances.get("wuerzburg").put("bayreuth", 147);
        distances.get("wuerzburg").put("frankfurt/main", 130);
        distances.get("wuerzburg").put("fulda", 100);
        distances.get("wuerzburg").put("nuernberg", 108);

        coordinates = new HashMap<String, Point>();
        coordinates.put("aachen", new Point(-209.60379, 249.47157));
        coordinates.put("augsburg", new Point(134.80635, -18.575178));
        coordinates.put("bayreuth", new Point(179.32399, 157.053));
        coordinates.put("berlin", new Point(293.09943, 442.5178));
        coordinates.put("bremen", new Point(-16.931591, 504.64734));
        coordinates.put("cottbus", new Point(361.43076, 358.53146));
        coordinates.put("chemnitz", new Point(269.5081, 254.68588));
        coordinates.put("dresden", new Point(325.56674, 279.0941));
        coordinates.put("erfurt", new Point(136.25624, 271.9933));
        coordinates.put("essen", new Point(-141.96866, 325.35834));
        coordinates.put("frankfurt/main", new Point(-27.608, 175.58119));
        coordinates.put("frankfurt/oder", new Point(371.03522, 422.43652));
        coordinates.put("freiburg", new Point(-90.64952, -59.292046));
        coordinates.put("fulda", new Point(43.13819, 223.62091));
        coordinates.put("garmisch-part.", new Point(152.07657, -114.76524));
        coordinates.put("hamburg", new Point(63.380383, 558.3458));
        coordinates.put("hannover", new Point(44.825264, 426.9851));
        coordinates.put("karlsruhe", new Point(-48.82897, 53.54009));
        coordinates.put("kassel", new Point(29.742897, 308.71664));
        coordinates.put("kiel", new Point(68.695816, 643.33014));
        coordinates.put("koblenz", new Point(-104.14378, 201.43147));
        coordinates.put("koeln", new Point(-148.25447, 267.99976));
        coordinates.put("leipzig", new Point(229.1317, 311.15707));
        coordinates.put("lindau", new Point(45.822735, -109.21826));
        coordinates.put("magdeburg", new Point(173.56235, 398.0283));
        coordinates.put("mannheim", new Point(-43.54089, 105.24141));
        coordinates.put("muenchen", new Point(184.8133, -44.536476));
        coordinates.put("muenster", new Point(-98.30054, 380.8315));
        coordinates.put("neubrandenburg", new Point(276.2144, 557.0144));
        coordinates.put("nuernberg", new Point(145.11511, 101.5798));
        coordinates.put("osnabrueck", new Point(-69.30297, 415.89078));
        coordinates.put("passau", new Point(322.74014, 3.6142504));
        coordinates.put("regensburg", new Point(220.39214, 53.54009));
        coordinates.put("rostock", new Point(198.72835, 616.2598));
        coordinates.put("saarbruecken", new Point(-150.04137, 77.505005));
        coordinates.put("schwerin", new Point(154.01888, 565.11285));
        coordinates.put("stuttgart", new Point(8.18225, 27.57841));
        coordinates.put("trier", new Point(-173.55475, 134.86357));
        coordinates.put("ulm", new Point(67.17258, -14.913567));
        coordinates.put("wilhelmshaven", new Point(-62.93731, 552.79846));
        coordinates.put("wuerzburg", new Point(61.723507, 140.4113));
    }

    public static void print(String s) {
        System.out.println(s);
    }

    public static double calculateHeuristic (String city, String goal) {
        return Math.sqrt( Math.pow(coordinates.get(city).x - coordinates.get(goal).x, 2)
                + Math.pow(coordinates.get(city).y- coordinates.get(goal).y, 2));
    }

    public static void initHashMap (String goal) {
        heuristic = new HashMap<String, Double>();
        for (String key : coordinates.keySet()) {
            heuristic.put(key, calculateHeuristic(key, goal));
        }
    }

    public static void learningRealTimeAStar (String city, String goal) {
        // Initialize heuristic H(n) with h(n)
        initHashMap(goal);

        String state = city;
        ArrayList path = new ArrayList<String>();
        path.add(state);
        List expanded;

        for (int i = 0; i < 1000; i++) {
            if (state.equals(goal)) {
                break;
            }
            // Expand node n
            expanded = expand(state);

            // Find the node n with lowest f(n)
            double minDistance = distance(state, expanded.get(0).toString())  + heuristic.get(expanded.get(0).toString());
            String minKey = expanded.get(0).toString();

            for (Object key : expanded) {
                double minDistContender = distance(state, key.toString()) + heuristic.get(key.toString());
                if (minDistContender < minDistance) {
                    minDistance = minDistContender;
                    minKey = key.toString();
                }
            }

            // Update H(n) if f(n') is bigger
            if (minDistance > heuristic.get(state)) {
                heuristic.replace(state, minDistance);
            }

            // Continue next loop with new state
            state = minKey;

            path.add(state);
            distanceTravelled += minDistance;
            expanded.clear();
        }

        pathTaken = new String[path.size()];
        path.toArray(pathTaken);
    }

    public static void main (String[] args) {
        initGraph();

        learningRealTimeAStar(args[0], args[1]);

        // Returns distance and path travelled
        print("Distance: ");
        print(String.valueOf(distanceTravelled));
        print("");

        print("Path: ");
        for (int i = 0; i < pathTaken.length; i++) {
            print(pathTaken[i]);
        }


        /* PATHS
            kiel -> essen - Distance: 1182.8365936769924
                kiel
                hamburg
                bremen
                osnabrueck
                muenster
                essen

            aachen -> frankfurt/oder - Distance: 3361.137987290094
                aachen
                koeln
                essen
                muenster
                osnabrueck
                hannover
                magdeburg
                berlin
                frankfurt/oder

            freiburg -> schwerin - Distance: 5101.817589192996
                freiburg
                karlsruhe
                mannheim
                frankfurt/main
                fulda
                kassel
                erfurt
                chemnitz
                leipzig
                magdeburg
                hannover
                bremen
                hamburg
                schwerin
         */
    }
}