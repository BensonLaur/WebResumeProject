package com.neusoft.util;

/**
 * zhangsb 2012-4-28
 **/

public class UniqueStringGenerator {

	private UniqueStringGenerator()
	{
	}

	public static synchronized String getUniqueString()
	{
		if (generateCount > MAX_GENERATE_COUNT)
			generateCount = 0;
		String uniqueNumber = Long.toString(System.currentTimeMillis())
				+ Integer.toString(generateCount);
		generateCount++;
		return uniqueNumber;
	}

	private static final int MAX_GENERATE_COUNT = 99999;
	private static int generateCount = 0;

}
