package org.buzheng.demo.esm.service;

public class BusinessExistsException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5938178916897833968L;

	public BusinessExistsException() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public UserExistsException(String message, Throwable cause,
//			boolean enableSuppression, boolean writableStackTrace) {
//		super(message, cause, enableSuppression, writableStackTrace);
//		// TODO Auto-generated constructor stub
//	}

	public BusinessExistsException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public BusinessExistsException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public BusinessExistsException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
}
