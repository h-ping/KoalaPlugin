package com.kalengo.loan.plugins;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
 

/**
 * @author Administrator 获取应用版本号
 */
public class KoalaPlugin extends CordovaPlugin {
	public static String GetVersion = "get";

	public boolean execute(String action, JSONArray data,
			CallbackContext callbackContext) throws JSONException {
		UrlUtil.info("david", "getversion---" + action);
		if (GetVersion.equals(action)) {
			MyApplication application = (MyApplication) this.cordova
					.getActivity().getApplication();
			callbackContext.success(application.getJsonVersion());
			return true;
		}
		return false;
	}

}