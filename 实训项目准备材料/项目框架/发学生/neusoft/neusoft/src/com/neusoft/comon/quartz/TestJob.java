package com.neusoft.comon.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.neusoft.basis.base.SessionCtx;

public class TestJob implements Job {

	public void execute(JobExecutionContext context)

	     throws JobExecutionException {
		SessionCtx.clearSessionCtx();
	}

}
