package com.neusoft.basis.user.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.user.entity.MenuItemEntity;
import com.neusoft.basis.user.entity.UserEntity;
import com.neusoft.basis.user.mapper.UserMapper;
import com.neusoft.comon.scoreboard.ScoreBoard;
import com.neusoft.comon.spring.SpringFactory;

public class GetScoreMenuAction extends EbAction {

	private static final long serialVersionUID = 5190087351895450870L;
	private UserEntity userEntity;
	@Autowired
	private UserMapper userMapper;
	private String menuStr;

	public String execute() throws Exception {
		StringBuffer menuBuf = new StringBuffer();
		List<MenuItemEntity> menuItemEneities = userMapper
				.getUserScoreMenuItem(((UserEntity) (getSession().get("user")))
						.getGroupId());
		String menuId = null;
		String fullPath = ServletActionContext.getRequest().getScheme() + "://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath() + "/";
		;
		for (MenuItemEntity menuItemEneity : menuItemEneities) {
			if (menuId == null || !menuItemEneity.getMenuId().equals(menuId)) {
				if (menuId != null) {
					menuBuf.append("</tbody>");
					menuBuf.append("</table></td>");
					menuBuf.append("</tr>");
					menuBuf.append("</tbody>");
					menuBuf.append("</table></td>");
					menuBuf.append("</tr>");
					menuBuf.append("<tr>");
					menuBuf
							.append("<td height=\"5\" style=\"background:url(").append(fullPath).append("images/tableline_bottom.jpg) no-repeat\" bgcolor=\"#9BC2ED\"></td>");
					menuBuf.append("</tr>");
				}
				menuId = menuItemEneity.getMenuId();
				menuBuf.append("<tr>");
				menuBuf
						.append("<td height=\"5\" style=\"background:url(").append(fullPath).append("images/tableline_top.jpg) no-repeat\"  bgcolor=\"#16ACFF\"></td>");
				menuBuf.append("</tr>");
				menuBuf.append("<tr>");
				menuBuf
						.append(" <td><table width=\"97%\" border=0 align=right cellPadding=0 cellSpacing=0 class=leftframetable>");
				menuBuf.append("<tbody>");
				menuBuf.append("<tr>");
				menuBuf
						.append("<td height=\"25\" style=\"background:url(").append(fullPath).append("images/left_tt.gif) no-repeat\">");
				menuBuf
						.append("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
				menuBuf.append("<tr>");
				menuBuf.append("<td width=\"20\"></td>");
				menuBuf
						.append(
								"<td class=\"STYLE1\" style=\"CURSOR: hand\" onclick=\"showsubmenu('")
						.append(menuId).append("');\" height=25>").append(
								menuItemEneity.getMenuName()).append("</td>");
				menuBuf.append("</tr>");
				menuBuf.append("</table>");
				menuBuf.append("</td>");
				menuBuf.append("</tr>");
				menuBuf.append("<tr>");
				menuBuf
						.append("<td><table id=\"submenu")
						.append(menuId)
						.append(
								"\" cellSpacing=0 cellPadding=0 width=\"100%\" border=0>");
				menuBuf.append("<tbody>");
			}
			menuBuf.append("<tr>");
			menuBuf
					.append("<td width=\"2%\"><img src=\"").append(fullPath).append("images/closed.gif\"></td>");
			menuBuf.append("<td height=23><a href=\"").append(fullPath).append(
					menuItemEneity.getItemUrl()).append("?sessionId=").append(
					getSessionId()).append("\"");
			menuBuf.append(" target=main>")
					.append(menuItemEneity.getItemName()).append("(<font color='red'><b>").append(((ScoreBoard)SpringFactory.getObject(menuItemEneity.getBean())).getCount((UserEntity) (getSession().get("user")))).append("</b></font>)").append("</a></td>");
			menuBuf.append("</tr>");
		}
		if (menuItemEneities.size() > 0) {
			menuBuf.append("</tbody>");
			menuBuf.append("</table></td>");
			menuBuf.append("</tr>");
			menuBuf.append("</tbody>");
			menuBuf.append("</table></td>");
			menuBuf.append("</tr>");
			menuBuf.append("<tr>");
			menuBuf
					.append("<td height=\"5\" style=\"background:url(").append(fullPath).append("images/tableline_bottom.jpg) no-repeat\" bgcolor=\"#9BC2ED\"></td>");
			menuBuf.append("</tr>");
		}
		
		
		menuStr = menuBuf.toString();
		return SUCCESS;
	}

	public String input() throws Exception {
		return INPUT;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public String getMenuStr() {
		return menuStr;
	}

	public void setMenuStr(String menuStr) {
		this.menuStr = menuStr;
	}

	
}
