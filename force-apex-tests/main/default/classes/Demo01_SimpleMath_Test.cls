@IsTest
private class Demo01_SimpleMath_Test {
    @IsTest
    private static void testNumbersPlus() {
        Demo01_SimpleMath simpleMath = new Demo01_SimpleMath();
        Integer result = simpleMath.numbersPlus(2, 3);
        System.assertEquals(5, result, 'Basic test 2 + 3 = 5');
    }
}
