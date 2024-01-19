//
//  NodeLabel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class NodeLabel : BaseNode {
    
    public override init(_ obj: JsonObj) {
        super.init(obj)
    }
        
    public func getLabel(_ key:String) -> String{
        return getObj().optString( key, "")
    }
    
    public var live:String { return getLabel("live") }
    public var premium:String { return getLabel("premium") }
    public var resend_receipt:String { return getLabel("resend_receipt") }
    public var reconciliation_text:String { return getLabel("reconciliation_text") }
    public var current_subscription_text:String { return getLabel("current_subscription_text")}
    public var current_subscription:String {return getLabel("current_subscription")}
    
    public var send_feedback:String { return getLabel("send_feedback") }
    
    public var playing_now:String { return getLabel("playing_now") }
    public var stream_live:String { return getLabel("stream_live") }
    public var ait_all_access:String { return getLabel("ait_all_access") }
    public var header_text:String { return getLabel("header_text") }
    public var try_free:String { return getLabel("try_free") }
    public var premium_callout_text:String { return getLabel("premium_callout_text") }
    public var stripe_button_text:String { return getLabel("stripe_button_text") }
    public var section_title:String { return getLabel("section_title") }
    public var new_episode_label:String { return getLabel("new_episode_label") }
    public var error_message:String { return getLabel("error_message") }
    public var social_login:String { return getLabel("social_login") }
    public var button_text:String { return getLabel("button_text") }
    public var section_title_for_description:String { return getLabel("section_title_for_description") }
    public var section_title_for_cast_crew:String { return getLabel("section_title_for_cast_crew") }
    public var search_overlay_text:String { return getLabel("search_overlay_text") }
    public var free_payment_button_text:String { return getLabel("free_payment_button_text") }
    public var search_label_small:String { return getLabel("search_label_small") }
    public var welcome_message:String { return getLabel("welcome_message") }
    public var edit_profile:String { return getLabel("edit_profile") }
    public var change_profile_photo:String { return getLabel("change_profile_photo") }
    public var account_details:String { return getLabel("account_details") }
    public var name:String { return getLabel("name") }
    public var password:String { return getLabel("password") }
    public var old_password:String { return getLabel("old_password") }
    public var retype_password:String { return getLabel("retype_password") }
    public var update_profile:String { return getLabel("update_profile") }
    public var subscriptions:String { return getLabel("subscriptions") }
    public var my_library:String { return getLabel("my_library") }
    public var languages:String { return getLabel("languages") }
    public var billing_details:String { return getLabel("billing_details") }
    public var update_payment_mode:String { return getLabel("update_payment_mode") }
    public var content_language:String { return getLabel("content_language") }
    public var plan_subline:String { return getLabel("plan_subline") }
    public var sign_in_from_web:String { return getLabel("Sign-in from the web") }
    public var link_title:String { return getLabel("link_title") }
    public var link_description:String { return getLabel("link_description") }
    public var reedem_giftcard:String { return getLabel("reedem_giftcard") }
    public var copyright:String { return getLabel("copyright") }
    public var not_robot:String { return getLabel("not_robot") }
    public var verify_not_robot:String { return getLabel("verify_not_robot") }
    public var createAccount:String { return getLabel("createAccount") }
    public var day:String { return getLabel("day") }
    public var month:String { return getLabel("month") }
    public var year:String { return getLabel("year") }
    public var date:String { return getLabel("date") }
    
    public var gender:String { return getLabel("gender") }
    public var male:String { return getLabel("male") }
    public var female:String { return getLabel("female") }
    
    
    
    
    public var upgrade:String { return getLabel("upgrade") }
    public var disclaimer_text:String { return getLabel("disclaimer_text") }
    public var cancel:String { return getLabel("cancel") }
    public var cancel_request_text:String { return getLabel("cancel_request_text") }
    public var cancel_subscription_message:String { return getLabel("cancel_subscription_message") }
    public var cancel_others_message:String { return getLabel("cancel_others_message") }
    public var cancel_error_message:String { return getLabel("cancel_error_message") }
    public var submit:String { return getLabel("submit") }
    
    public var current_password_missing:String { return getLabel("current_password_missing") }
    public var password_missing:String { return getLabel("password_missing") }
    public var confirm_password_missing:String { return getLabel("confirm_password_missing") }
    public var enter_valid_email:String { return getLabel("enter_valid_email") }
    public var otp_success:String { return getLabel("otp_success") }
    public var password_limit_small:String { return getLabel("password_limit_small") }
    public var accept_terms_conditions:String { return getLabel("accept_terms_conditions") }
    public var name_missing:String { return getLabel("name_missing") }
    public var old_password_missing:String { return getLabel("old_password_missing") }
    public var accept_terms_conditions_for_cookie_consent:String { return getLabel("accept_terms_conditions_for_cookie_consent") }
    public var confirm_password_mismatch:String { return getLabel("confirm_password_mismatch") }
    public var success_message_title:String { return getLabel("success_message_title") }
    public var success_button_text:String { return getLabel("success_button_text") }
    public var profile:String { return getLabel("profile") }
    
    
    public var error:String { return getLabel("error") }
    public var google_signin_failed:String { return getLabel("google_signin_failed") }
    public var facebook_signin_failed:String { return getLabel("facebook_signin_failed") }
    
    
    public var expansion_panel_expand_text:String { return getLabel("expansion_panel_expand_text") }
    public var expansion_panel_collapse_text:String { return getLabel("expansion_panel_collapse_text") }
    
    public var nickname:String { return getLabel("nickname") }
    public var person_by_section_title:String { return getLabel("person_by_section_title") }
    public var view_profile:String { return getLabel("view_profile") }
    
    
    public var cookie_disabled_message:String { return getLabel("cookie_disabled_message") }
    public var cookie_reenable_message:String { return getLabel("cookie_reenable_message") }
    public var cookie_reenable_allow_label:String { return getLabel("cookie_reenable_allow_label") }
    public var cookie_reenable_deny_label:String { return getLabel("cookie_reenable_deny_label") }
    
    
    public var app_tracking_disabled_message:String { return getLabel("app_tracking_disabled_message") }
    public var app_tracking_reenable_message:String { return getLabel("app_tracking_reenable_message") }
    public var app_tracking_reenable_allow_label:String { return getLabel("app_tracking_reenable_allow_label") }
    public var app_tracking_reenable_deny_label:String { return getLabel("app_tracking_reenable_deny_label") }

    
    public var cmp_disabled_message:String { return getLabel("cmp_disabled_message") }
    public var cmp_reenable_message:String { return getLabel("cmp_reenable_message") }
    public var cmp_reenable_allow_label:String { return getLabel("cmp_reenable_allow_label") }
    public var cmp_reenable_deny_label:String { return getLabel("cmp_reenable_deny_label") }
    
    
    public var lastName:String { return getLabel("lastName"); }
    public var phoneNumber:String { return getLabel("phoneNumber"); }
    public var birthday:String { return getLabel("birthday"); }
    public var others:String { return getLabel("others"); }
    public var optional:String { return getLabel("optional"); }
    public var questions:String { return getLabel("questions"); }
    
    
    public var account_deletion:String { return getLabel("account_deletion"); }
    public var account_deletion_instruction:String { return getLabel("account_deletion_instruction"); }
    
    
    
    public var form_validation_enter_name:String { return getLabel("form_validation_enter_name"); }
    public var form_validation_enter_last_name:String { return getLabel("form_validation_enter_last_name"); }
    public var form_validation_enter_first_name:String { return getLabel("form_validation_enter_first_name"); }
    public var form_validation_enter_password:String { return getLabel("form_validation_enter_password"); }
    public var form_validation_enter_a_valid_last_name:String { return getLabel("form_validation_enter_a_valid_last_name"); }
    public var form_validation_enter_a_valid_first_name:String { return getLabel("form_validation_enter_a_valid_first_name"); }
    public var form_validation_enter_a_valid_phone_number:String { return getLabel("form_validation_enter_a_valid_phone_number"); }
    public var form_validation_enter_email_id:String { return getLabel("form_validation_enter_email_id"); }
    public var form_validation_enter_valid_email_id:String { return getLabel("form_validation_enter_valid_email_id"); }
    public var form_validation_enter_phone_number:String { return getLabel("form_validation_enter_phone_number"); }
    public var form_validation_enter_a_valid_dob:String { return getLabel("form_validation_enter_a_valid_dob"); }
    public var form_validation_password_must_be_8_chars_long:String { return getLabel("form_validation_password_must_be_8_chars_long"); }
    public var form_validation_enter_confirm_password:String { return getLabel("form_validation_enter_confirm_password"); }
    public var form_validation_confirm_password_is_not_matching:String { return getLabel("form_validation_confirm_password_is_not_matching"); }
    public var form_validation_please_accept_the_terms_and_conditions_to_proceed:String { return getLabel("form_validation_please_accept_the_terms_and_conditions_to_proceed"); }
    
    
    
    public var confirm_email_mismatch_message:String { return getLabel("confirm_email_mismatch_message"); }
        
}
