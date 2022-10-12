@IsTest
private class Demo01_SimpleMath_Test {
    @IsTest
    private static void testNumbersPlus() {
        Demo01_SimpleMath simpleMath = new Demo01_SimpleMath();
        Integer result = simpleMath.numbersPlus(2, 3);
        System.assertEquals(5, result, 'Basic test 2 + 3 = 5');
    }

    @IsTest
    private static void testNumbersMinus() {
        Demo01_SimpleMath simpleMath = new Demo01_SimpleMath();
        Integer result = simpleMath.numbersMinus(5, 3);
        System.assertEquals(2, result, 'Basic test 5 - 3 = 2');
    }
}
