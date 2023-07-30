public class Count implements AutoCloseable {
    private static int count = 0;
    private static boolean isClosed = false;

    public static void increaseCount() {
        if (!isClosed) {
            count++;
        } else {
            throw new RuntimeException("Счетчик закрыт");
        }

    }

    int getCount() {
        return count;
    }

    @Override
    public void close() {
        isClosed = true;
    }
}
