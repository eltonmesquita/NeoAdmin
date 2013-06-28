<?php
  if ($total_customer_approval > 0) {
  $costumer_approval_notification = 'active';
  }
  
  if ($total_review_approval > 0) {
  $review_approval_notification = 'active';
  }
  
  if ($total_affiliate_approval > 0) {
  $affiliate_approval_notification = 'active';
  }
?>

<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_install) { ?>
  <div class="warning"><?php echo $error_install; ?></div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="warning"><?php echo $error_image; ?></div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="warning"><?php echo $error_image_cache; ?></div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="warning"><?php echo $error_cache; ?></div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="warning"><?php echo $error_download; ?></div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="warning"><?php echo $error_logs; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-screen"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
      <div class="row">
        <div class="large-6 overview columns">
            
            <div class="dashboard-box hightlight">
              <h4><?php echo $text_total_sale; ?></h4>
              <span><?php echo $total_sale; ?></span>
            </div>
            
            <ul class="large-block-grid-4 small-block-grid-1">
              <li>
                <div class="dashboard-box client-approval">
                  <a href="index.php?route=sale/customer&token=<?php echo $token; ?>" title=""></a>
                  <i class="icon-user"></i>
                  <p><?php echo $text_total_customer_approval; ?></p>
                  <span class="notification <?php echo $costumer_approval_notification ?>"><?php echo $total_customer_approval; ?></span>
                </div>
              </li>

              <li>
                <div class="dashboard-box comment-approval">
                  <a href="index.php?route=catalog/review&token=<?php echo $token; ?>" title=""></a>
                  <i class="icon-bubbles"></i>
                  <p><?php echo $text_total_review_approval; ?></p>
                  <span class="notification <?php echo $review_approval_notification ?>"><?php echo $total_review_approval; ?></span>
                </div>
              </li>

              <li>
                <div class="dashboard-box affiliate-approval">
                  <a href="index.php?route=sale/affiliate&token=<?php echo $token; ?>" title=""></a>
                  <i class="icon-address-book"></i>
                  <p><?php echo $text_total_affiliate_approval; ?></p>
                  <span class="notification <?php echo $affiliate_approval_notification ?>"><?php echo $total_affiliate_approval; ?></span>
                </div>
              </li>
              
              <li>
                <div class="dashboard-box sales-year">
                  <a href="index.php?route=sale/order&token=<?php echo $token; ?>" title=""></a>
                  <i class="icon-coin"></i>
                  <p><?php echo $text_total_sale_year; ?><br>
                  <span><?php echo $total_sale_year; ?></span></p>
                </div>
              </li>
              
            </ul>

        </div>
        <div class="large-6 statistic columns">
          <div class="range"><?php echo $entry_range; ?>
            <select id="range" onchange="getSalesChart(this.value)">
              <option value="day"><?php echo $text_day; ?></option>
              <option value="week"><?php echo $text_week; ?></option>
              <option value="month"><?php echo $text_month; ?></option>
              <option value="year"><?php echo $text_year; ?></option>
            </select>
          </div>
          <div class="dashboard-heading"><?php echo $text_statistics; ?></div>
          <div class="dashboard-content">
            <div id="report" style="width: 100%; max-width: 100%; height: 170px; margin: auto;"></div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="large-12 latest columns">
          <div class="dashboard-heading"><?php echo $text_latest_10_orders; ?></div>
          <div class="dashboard-content">
            <table class="responsive list">
              <thead>
                <tr>
                  <td class="right"><?php echo $column_order; ?></td>
                  <td class="left"><?php echo $column_customer; ?></td>
                  <td class="left"><?php echo $column_status; ?></td>
                  <td class="left"><?php echo $column_date_added; ?></td>
                  <td class="right"><?php echo $column_total; ?></td>
                  <td class="right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="right"><?php echo $order['order_id']; ?></td>
                  <td class="left"><?php echo $order['customer']; ?></td>
                  <td class="left"><?php echo $order['status']; ?></td>
                  <td class="left"><?php echo $order['date_added']; ?></td>
                  <td class="right"><?php echo $order['total']; ?></td>
                  <td class="right"><?php foreach ($order['action'] as $action) { ?>
                    <a class="button edit" href="<?php echo $action['href']; ?>"><i class="icon-edit"></i> <?php echo $action['text']; ?></a>
                    <?php } ?></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'get',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json.xaxis
				}
			}

			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script> 
<?php echo $footer; ?>