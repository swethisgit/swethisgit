//
//  BaseWidget.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 13/04/2023.
//

import Foundation
open class BaseWidget : ApiKey {

    public static let TYPE_MOVIE_HORIZONTAL_LISTING = "MovieHorizontalListing";
    public static let TYPE_PLAYLIST_HORIZONTAL_LISTING = "PlaylistHorizontalListing";
    public static let TYPE_VIDEO_HORIZONTAL_LISTING = "VideoHorizontalListing";
    public static let TYPE_MISC_CARD_HORIZONTAL_LISTING = "CardHorizontalListing";

    public static let TYPE_MOVIE_GRID_LISTING = "MovieGridListing";
    public static let TYPE_VIDEO_GRID_LISTING = "VideoGridListing";

    public static let TYPE_VIDEO_DETAILS = "VideoDetails";
    public static let TYPE_MOVIE_DETAILS = "MovieDetails";
    public static let TYPE_LIVE_VIDEO_DETAILS = "LiveVideoDetails";
    public static let TYPE_RADIO_DETAILS = "RadioDetails";
    public static let TYPE_HYBRID_DETAIL_WIDGET = "HybridDetailWidget";
    

    public static let TYPE_VIDEO_CAROUSEL = "VideoCarousel";
    

    public static let TYPE_SHOW_LISTING = "ShowListing";
    public static let TYPE_SHOW_GRID_LISTING = "ShowGridListing";
    
    

    public static let TYPE_LOGIN_CONNECT = "LoginConnect";
    public static let TYPE_AUTH_CALLOUT = "AuthCallOut";
    public static let TYPE_LOGIN_FORM = "LoginForm";
    public static let TYPE_REGISTER_FORM = "RegisterForm";
    public static let TYPE_FORGOT_PASSWORD_FORM = "ForgotPasswordForm";

    public static let TYPE_USER_PROFILE = "UserProfile";

    public static let TYPE_WEBVIEW = "WebView";
    public static let TYPE_MESSAGE_WIDGET = "MessageWidget";
    public static let TYPE_MESSAGE_DETAILS = "MessageDetails";
    public static let TYPE_DEVICE_CONNECT = "DeviceConnect";
    
    
    public static let TYPE_HEADER_MENU = "Header";
    public static let TYPE_FOOTER_MENU = "FooterMenu";
    public static let TYPE_MENU = "Menu";
    public static let TYPE_NAV_BAR = "NavBar";
    
    public static let TYPE_LAUNCH = "Launch";

    public static let TYPE_PLAN_LISTING = "PlanListing";
    public static let TYPE_PAYMENT = "Payment";
    public static let TYPE_CHECKOUT_PAYMENT = "CheckoutPayment";
    public static let TYPE_MULTI_PLAN_PAYMENT = "MultiPlanPayment";
    
    public static let TYPE_PAYMENT_CONFIRMATION = "PaymentConfirmation";
    
    public static let TYPE_ACTIVE_SUBSCRIPTIONS = "ActiveSubscriptions";
    public static let TYPE_INACTIVE_SUBSCRIPTIONS = "InactiveSubscriptions";
    public static let TYPE_RECONCILIATION = "Reconciliation";

    public static let TYPE_DOWNLOAD_HISTORY = "DownloadHistory";
    public static let TYPE_VIDEO_META = "VideoMeta"
    
    public static let TYPE_VIDEO_FILTER = "VideoFilter"
 
    public static let TYPE_CHANNEL_HORIZONTAL_LISTING = "ChannelHorizontalListing";
    public static let TYPE_VERTICAL_LISTING = "VerticalListing";
    public static let TYPE_EPG_VERTICAL_LISTING = "EpgVerticalListing"
    public static let TYPE_SHOW_VERTICAL_LISTING = "ShowVerticalListing";
    public static let TYPE_SHOW_HORIZONTAL_LISTING = "ShowHorizontalListing";
    public static let TYPE_CATCHUP_VERTICAL_LISTING = "CatchupVerticalListing";
    public static let TYPE_CATCHUP_VIDEO_VERTICAL_LISTING = "CatchupVideoVerticalListing";
    public static let TYPE_CATCHUP_RADIO_VERTICAL_LISTING = "CatchupRadioVerticalListing";
    public static let TYPE_MESSAGE_VERTICAL_LISTING = "MessageVerticalListing";
    public static let TYPE_VIDEO_VERTICAL_LISTING = "VideoVerticalListing";
    public static let TYPE_COMPOSITE_EPG_VERTICAL_LISTING = "CompositeEpgVerticalListing";
    public static let TYPE_CHANNEL_EPG_HORIZONTAL_LISTING = "ChannelEpgHorizontalListing";
    
    public static let TYPE_HYBRID_POSTER_WIDGET = "HybridPosterWidget";
    public static let TYPE_HYBRID_HORIZONTAL_LISTING = "HybridHorizontalListing";
    public static let TYPE_HORIZONTAL_AD_BANNER = "HorizontalAdBanner";
    public static let TYPE_HYBRID_GRID_LISTING = "HybridGridListing";
    public static let TYPE_HYBRID_CAROUSEL = "HybridCarousel";
    
    public static let TYPE_HYBRID_TAB_WIDGET = "HybridTab";
    public static let TYPE_REVIEWS_AND_COMMENTS = "ReviewsAndComments";
    public static let TYPE_HYBRID_MENU = "HybridMenu";
    
    public static let TYPE_DOWNLOAD_HORIZONTAL_LISTING = "DownloadHorizontalListing";
    
    
    
    public static let TYPE_TICKET_VERTICAL_LISTING = "TicketVerticalListing";

    
    
    
    public static let TYPE_SUPPORT_FORM = "SupportForm";
    public static let TYPE_INFO_WIDGET = "InfoWidget";
    public static let TYPE_SEARCH_FORM = "SearchForm";
    public static let TYPE_SEARCH_SUGGESTIONS = "SearchSuggestions";
    
    
    public static let TYPE_LOAD_MORE = "LoadMore"
    public static let TYPE_HYBRID_FORM = "HybridForm"
    
    
    public static let TYPE_CATEGORY_HORIZONTAL_LISTING = "CategoryHorizontalListing"
    public static let TYPE_DU_TELECOM_WIDGET = "DuTelecomWidget"
    public static let TYPE_FRESH_CHAT_WIDGET = "FreshChatWidget"
    
    
   
    public static let TYPE_SHOW_DETAILS = "ShowDetails"
    
    public static let TYPE_ACCORDION_STACK = "AccordionStack"
    
    public static let TYPE_NOT_FOUND = "NotFound";
    
    public static let TYPE_QUESTION_WIDGET = "QuestionWidget";
    public static let TYPE_TEST_WIDGET = "TestWidget"
    
    
    
    public static let __META_KEY_LARGE_TITLE = "largeTitle";
    

    private let mWidget:JsonObj

    public init(_ widget:JsonObj) {
        mWidget = widget;
    }

    public func getWidgetJSONObject() -> JsonObj {
        return mWidget;
    }

    public func getType() -> String {
        return mWidget.optString(BaseWidget.__KEY_TYPE,"")
    }

    public func getData() -> JsonObj {
        return mWidget.optJsonObj(BaseWidget.__KEY_DATA)
    }
        
    public func getMeta() -> JsonObj {
        return mWidget.optJsonObj(BaseWidget.__KEY_META)
    }
    
    public func getJSONArrayDataItem(_ key:String) -> [AnyObject]{
        return getJSONArrayItem(key)
    }
    
    public func getJSONObjectDataItem(_ key:String) -> JsonObj{
        return getData().optJsonObj(key)
    }
    
    
    public func getJSONArrayItem(_ key:String) -> [AnyObject]
    {
        return getData().optJsonArray(key)
    }
    
    public func getJSONObjectMetaItem(_ key:String) -> JsonObj
    {
        return getMeta().optJsonObj(key)
    }
    
    public func getUrlOfType(_ key:String, _ type:String, _ fallback:String) -> String {
        return type==getData().optJsonObj(key).optString(ApiKey.__KEY_TYPE)
            ? getData().optJsonObj(key).optString(ApiKey.__KEY_URL, fallback) : fallback;
    }
    
    public func getUrlOfTypeFromObj(_ obj:JsonObj,_ key:String, _ type:String, _ fallback:String) -> String {
        return type==obj.optJsonObj(key).optString(ApiKey.__KEY_TYPE)
            ? obj.optJsonObj(key).optString(ApiKey.__KEY_URL, fallback) : fallback;
    }
    
    public func hasCards() -> Bool {
        return getData().has(ApiKey.__KEY_CARDS)
    }

    open func getCards() -> [AnyObject] {
        return getData().optJsonArray(ApiKey.__KEY_CARDS)
    }
    
    public func getLinks() -> [AnyObject] {
        return getData().optJsonArray(ApiKey.__KEY_LINKS)
    }
    
    public func getRefreshUrl() -> String {
        return getData().optJsonObj(ApiKey.__KEY_REFRESH_CAROUSAL_URL).optString(ApiKey.__KEY_URL)
    }
//    public func getTabs() -> [VtnNodeFilterTab]
//    {
//        var mVtnNodeFilterTabList:[VtnNodeFilterTab] = [VtnNodeFilterTab]()
//        let countryList = getJSONArrayDataItem(BaseWidget.__KEY_TABS)
//
//        for item in countryList {
//            if let obj = item as? [String:AnyObject] {
//                mVtnNodeFilterTabList.append(VtnNodeFilterTab(VtnJson(obj)))
//            }
//        }
//
//        return mVtnNodeFilterTabList
//    }
    
    public func getFilterWidget() -> JsonObj
    {
        return getJSONObjectDataItem(ApiKey.__KEY_FILTER_WIDGET)
    }
    
    public func getTitle() -> String {
        return getData().optString(BaseWidget.__KEY_TITLE,"");
    }
    
    public func getSubTitle() -> String {
           return getData().optString(BaseWidget.__KEY_SUB_TITLE, getData().optString(BaseWidget.__KEY_SUBTITLE,""));
    }
    
    private func getNextUrlObj() -> JsonObj {
        return getData().optJsonObj(getNextUrlKey())
    }
    
    open func getNextUrlKey() -> String {
        return BaseWidget.__KEY_NEXT_URL
    }
    
    private func getNextUrlType() -> String {
        return getNextUrlObj().optString(BaseWidget.__KEY_TYPE,"")
    }
    
    public func getNextUrl() -> String
    {
        return BaseWidget.__KEY_DATA_URL == getNextUrlType() ? getNextUrlObj().optString(BaseWidget.__KEY_URL,"") : "";
    }

    public func showWidgetTitleAsLarge() -> Bool
    {
        return getMeta().optBoolean(BaseWidget.__META_KEY_LARGE_TITLE, false)
    }
    
    public func getLabels() -> NodeLabel{
        return NodeLabel(getData().optJsonObj(BaseWidget.__KEY_LABELS))
    }

    public func labels() -> NodeLabel{
        return NodeLabel(getData().optJsonObj(BaseWidget.__KEY_LABELS))
    }

//    public func getNoDataText() -> VtnNoDataCardData{
//        return VtnNoDataCardData(getData().optJsonObj(VtnBaseWidget.__KEY_NO_DATA))
//    }

    public func hasWidgets() -> Bool {
        return getData().has(BaseWidget.__KEY_WIDGETS)
    }

    public func getWidgets() -> [AnyObject]
    {
        return getJSONArrayDataItem(ApiKey.__KEY_WIDGETS)
    }
    
    public func getLayout() -> Int64{
        return mWidget.optInt(ApiKey.__KEY_LAYOUT,1)
    }
    
}
