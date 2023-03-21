import './add_jquery'
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .
import "@hotwired/turbo-rails";
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap

import "@fortawesome/fontawesome-free/js/all"
import "./courses"
import "./user_account"
import "./review_rate"
import "./courses_photos"
import "./use_billing_address"
require("jquery-mask-plugin")
$.jMaskGlobals.watchDataMask = true;
