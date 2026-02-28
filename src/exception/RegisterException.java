package exception;

public class RegisterException extends Exception{
	private static final long serialVersionUID = 1L;
	public RegisterException() {
		super();
	}
	public RegisterException(String message) {
		super(message);
	}
}
