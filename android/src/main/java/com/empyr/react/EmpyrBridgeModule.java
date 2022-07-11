package com.empyr.react;

import com.empyr.api.EmpyrClient;
import com.empyr.tracker.EmpyrTracker;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.uimanager.IllegalViewOperationException;

import java.util.HashMap;
import java.util.Map;

public class EmpyrBridgeModule extends ReactContextBaseJavaModule
{
    EmpyrClient client = null;
    EmpyrTracker tracker = null;

    public EmpyrBridgeModule( ReactApplicationContext reactContext )
    {
        super( reactContext ); //required by React Native
    }

    @Override
    //getName is required to define the name of the module represented in JavaScript
    public String getName()
    {
        return "EmpyrBridge";
    }

	@ReactMethod
	public void initialize( String clientId )
	{
		client = EmpyrClient.getInstance( clientId );
	}

    @ReactMethod
    public void track( Integer offerId, String trackerString )
    {
        try
        {
            tracker = EmpyrTracker.getInstance( client, getCurrentActivity().getApplicationContext() );
            tracker.track( offerId, trackerString.equalsIgnoreCase ( "PROFILE_VIEW" ) ? EmpyrTracker.Tracker.PROFILE_VIEW : EmpyrTracker.Tracker.SEARCH_VIEW );
        }
	catch ( IllegalViewOperationException e )
        {

        }
    }
}
