public class Solution {
    public static int[][] matrixMultiple(int[][] a, int[][] b) {
        try {
            if (a[0].length != b.length) {
                return null;
            }
            int m = a.length;
            int p = a[0].length;
            int n = b[0].length;
            int[][] c = new int[m][n];
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    int sum = 0;
                    for (int k = 0; k < p; k++) {
                        sum += a[i][k] * b[k][j];
                    }
                    c[i][j] = sum;
                }
            }
            return c;
        } catch (Exception e) {
            return null;
        }
    }
}
