<%@ page language="java" pageEncoding="UTF-8"%>
<div class="easyui-panel"
	data-options="title:'功能导航',border:false,fit:true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="数据管理" data-options="iconCls:'icon-sys'">
			
			<ul id="tt1" class="easyui-tree">	
				
				<li><span><a href="#" onclick="addTab('采样地信息',true,'jsps/interface/address.jsp')">采样地信息</a> </span>			
				</li>				
				<li><span><a href="#" onclick="addTab('样品信息',true,'jsps/interface/sample.jsp')">样品信息</a></span>
				</li>
				<li><span><a href="#" onclick="addTab('菌株基本信息',true,'jsps/interface/strainsParting.jsp')">菌株基本信息</a></span>
				</li>
				<li>
				   <span>MIC耐药性信息</span>
				   <ul>
				   <li><span><a href="#" onclick="addTab('阳性菌株',true,'jsps/interface/detection_yangxing.jsp')">阳性菌株</a></span></li>
				   <li><span><a href="#" onclick="addTab('阴性菌株',true,'jsps/interface/detection_yinxing.jsp')">阴性菌株</a></span></li>
				   </ul>
							   
				</li>						
				<li><span><a href="#" onclick="addTab('耐药性基因信息',true,'jsps/interface/gene.jsp')">耐药性基因信息</a></span>
				</li>
			</ul>
		</div>		
		<div title="数据汇总" data-options="iconCls:'icon-sys'">
		    <ul id="tt3" class="easyui-tree">	
		        <li><span><a href="#" onclick="addTab('耐药性分析',true,'jsps/interface/drugAnalyse.jsp')">耐药性分析</a></span></li>
			</ul>
		</div>
		<div title="编号管理" data-options="iconCls:'icon-sys'">
		    <ul id="tt4" class="easyui-tree">				
				<li><span><a href="#" onclick="addTab('药品标准信息',true,'jsps/interface/drugStandard.jsp')">药品标准信息</a></span>
				</li>
				<li><span><a href="#" onclick="addTab('来源编号',true,'jsps/interface/sourceCoding.jsp')">来源编号</a></span>
				</li>
				<li><span><a href="#" onclick="addTab('采样动物编号',true,'jsps/interface/animal.jsp')">采样动物编号</a></span>
				</li>
				<li><span><a href="#" onclick="addTab('菌种编号',true,'jsps/interface/bacteria.jsp')">菌种编号</a></span>
				</li>
<!-- 			<li><span><a href="#" onclick="addTab('药物管理',true,'jsps/interface/drugManage.jsp')">药物管理</a></span>
				</li> -->	
			</ul>
		</div>
		<div title="用户管理" data-options="iconCls:'icon-sys'">
		    <ul id="tt5" class="easyui-tree">				
				<li><span><a href="#" onclick="addTab('用户列表',true,'jsps/interface/user.jsp')">用户列表</a></span>
				</li>
			</ul>
		</div>
	</div>
</div>