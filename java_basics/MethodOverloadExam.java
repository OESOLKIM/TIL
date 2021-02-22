package javaStudy_01;

public class MethodOverloadExam {

	public static void main(String[] args) {
		MyClass2 m = new MyClass2();
		
		System.out.println(m.plus(4, 5));
		
		System.out.println(m.plus(4, 6, 7));
		
		System.out.println(m.plus("hello", "world"));
	}
	
}
