<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="icon" type="image/png" href="view/image/opencart.ico">

<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/stylesheet/foundation.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/neoadmin.css" />

<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript">
//-----------------------------------------
// Confirm Actions (delete, uninstall)
//-----------------------------------------
$(document).ready(function(){
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
    	
    // Confirm Uninstall
    $('a').click(function(){
        if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
});
</script>
</head>
<body>
<div class="row<?php if (!$logged) echo " logged-off"; ?>" id="container">
  <?php if ($logged) { ?>
  <div class="large-1 columns" id="menu-left">
    <img class="logo" src="view/image/logo.png" title="<?php echo $heading_title; ?>" onclick="location = '<?php echo $home; ?>'" />
    <div class="menu-wrapper">
      <div class="menu-icon"><a><i class="icon-list"></i></a></div>
      <nav>
        <ul class="left">
          <li id="dashboard"><a href="<?php echo $home; ?>" class="top first-menu"><i class="icon-screen"></i><?php echo $text_dashboard; ?></a></li>
          <li class="has-flyout" id="catalog"><a class="top"><i class="icon-file-2"></i><?php echo $text_catalog; ?></a>
            <ul class="flyout">
              <li><a href="<?php echo $category; ?>"><i class="icon-flow-cascade"></i><?php echo $text_category; ?></a></li>
              <li><a href="<?php echo $product; ?>"><i class="icon-box"></i><?php echo $text_product; ?></a></li>
              <li><a href="<?php echo $filter; ?>"><i class="icon-filter"></i><?php echo $text_filter; ?></a></li>
              <li class="has-flyout"><a class="parent"><i class="icon-text"></i><?php echo $text_attribute; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
                  <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $option; ?>"><i class="icon-list-2"></i><?php echo $text_option; ?></a></li>
              <li><a href="<?php echo $manufacturer; ?>"><i class="icon-wrench"></i><?php echo $text_manufacturer; ?></a></li>
              <li><a href="<?php echo $download; ?>"><i class="icon-download"></i><?php echo $text_download; ?></a></li>
              <li><a href="<?php echo $review; ?>"><i class="icon-bubbles"></i> <?php echo $text_review; ?></a></li>
              <li><a href="<?php echo $information; ?>"><i class="icon-info"></i><?php echo $text_information; ?></a></li>
            </ul>
          </li>
          <li class="has-flyout" id="extension"><a class="top"><i class="icon-cogs"></i><?php echo $text_extension; ?></a>
            <ul class="flyout">
              <li><a href="<?php echo $module; ?>"><i class="icon-cogs"></i> <?php echo $text_module; ?></a></li>
              <li><a href="<?php echo $shipping; ?>"><i class="icon-truck"></i> <?php echo $text_shipping; ?></a></li>
              <li><a href="<?php echo $payment; ?>"><i class="icon-coin"></i> <?php echo $text_payment; ?></a></li>
              <li><a href="<?php echo $total; ?>"><i class="icon-paste"></i><?php echo $text_total; ?></a></li>
              <li><a href="<?php echo $feed; ?>"><i class="icon-rss"></i><?php echo $text_feed; ?></a></li>
            </ul>
          </li>
          <li class="has-flyout" id="sale"><a class="top"><i class="icon-coin"></i><?php echo $text_sale; ?></a>
            <ul class="flyout">
              <li><a href="<?php echo $order; ?>"><i class="icon-paste"></i><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $return; ?>"><i class="icon-switch"></i><?php echo $text_return; ?></a></li>
              <li class="has-flyout"><a class="parent"><i class="icon-group"></i> <?php echo $text_customer; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $customer; ?>"><i class="icon-user"></i> <?php echo $text_customer; ?></a></li>
                  <li><a href="<?php echo $customer_group; ?>"><i class="icon-group"></i> <?php echo $text_customer_group; ?></a></li>
                  <li><a href="<?php echo $customer_ban_ip; ?>"><i class="icon-cross"></i> <?php echo $text_customer_ban_ip; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $affiliate; ?>"><i class="icon-address-book"></i> <?php echo $text_affiliate; ?></a></li>
              <li><a href="<?php echo $coupon; ?>"><i class="icon-ticket"></i><?php echo $text_coupon; ?></a></li>
              <li class="has-flyout"><a class="parent"><i class="icon-gift"></i><?php echo $text_voucher; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                  <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $contact; ?>"><i class="icon-envelope-alt"></i> <?php echo $text_contact; ?></a></li>
            </ul>
          </li>
          <li class="has-flyout" id="system"><a class="top"><i class="icon-cog"></i><?php echo $text_system; ?></a>
            <ul class="flyout">
              <li><a href="<?php echo $setting; ?>"><i class="icon-cog"></i> <?php echo $text_setting; ?></a></li>
              <li class="has-flyout"><a class="parent"><i class="icon-screen"></i><?php echo $text_design; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
                  <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
                </ul>
              </li>
              <li class="has-flyout"><a class="parent"><i class="icon-group"></i> <?php echo $text_users; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $user; ?>"><i class="icon-user"></i> <?php echo $text_user; ?></a></li>
                  <li><a href="<?php echo $user_group; ?>"><i class="icon-group"></i> <?php echo $text_user_group; ?></a></li>
                </ul>
              </li>
              <li class="has-flyout"><a class="parent"><i class="icon-earth"></i><?php echo $text_localisation; ?></a>
                <ul class="flyout up">
                  <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
                  <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
                  <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
                  <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
                  <li><a class="parent"><?php echo $text_return; ?></a>
                    <ul>
                      <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
                      <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
                      <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
                    </ul>
                  </li>
                  <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
                  <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
                  <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
                  <li><a class="parent"><?php echo $text_tax; ?></a>
                    <ul>
                      <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                      <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                    </ul>
                  </li>
                  <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
                  <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
                </ul>
              </li>
              <li><a href="<?php echo $error_log; ?>"><i class="icon-cross"></i> <?php echo $text_error_log; ?></a></li>
              <li><a href="<?php echo $backup; ?>"><i class="icon-database"></i><?php echo $text_backup; ?></a></li>
            </ul>
          </li>
          <li class="has-flyout" id="reports"><a class="top"><i class="icon-stats"></i><?php echo $text_reports; ?></a>
            <ul class="flyout">
              <li class="has-flyout"><a class="parent"><i class="icon-coin"></i> <?php echo $text_sale; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                  <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
                  <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
                  <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
                  <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
                </ul>
              </li>
              <li class="has-flyout"><a class="parent"><i class="icon-pie"></i> <?php echo $text_product; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                  <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
                </ul>
              </li>
              <li class="has-flyout"><a class="parent"><i class="icon-user"></i> <?php echo $text_customer; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
                  <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
                  <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
                  <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
                </ul>
              </li>
              <li class="has-flyout"><a class="parent"><i class="icon-address-book"></i> <?php echo $text_affiliate; ?></a>
                <ul class="flyout">
                  <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="has-flyout" id="help"><a class="top last-menu"><i class="icon-question-sign"></i><?php echo $text_help; ?></a>
            <ul class="flyout">
              <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
              <li><a href="http://www.opencart.com/index.php?route=documentation/introduction" target="_blank"><?php echo $text_documentation; ?></a></li>
              <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <div class="large-11 columns">
    <header>
      <div class="row">
        <div class="large-5 columns">
          <div class="div1">
            <div class="div2"><img id="logo" src="view/image/logo.png" title="<?php echo $heading_title; ?>" onclick="location = '<?php echo $home; ?>'" /></div>
          </div>
        </div>
        <div class="large-7 columns">
          <aside>
            <ul class="right">
              <li><?php if ($logged) { ?>
                <div class="div3"><i class="icon-lock"></i>&nbsp;<?php echo $logged; ?></div>
                <?php } ?>
              </li>
              <li id="store"><a href="<?php echo $store; ?>" target="_blank" class="top"><i class="icon-link"></i>&nbsp;<?php echo $text_front; ?></a>
                <ul>
                  <?php foreach ($stores as $stores) { ?>
                  <li><a href="<?php echo $stores['href']; ?>" target="_blank"><i class="icon-link"></i>&nbsp;<?php echo $stores['name']; ?></a></li>
                  <?php } ?>
                </ul>
              </li>
               <li><a class="top" href="<?php echo $logout; ?>"><i class="icon-off"></i>&nbsp;<?php echo $text_logout; ?></a></li>
            </ul>
          </aside>
        </div>
      </div>
    </header>
  <?php } ?>