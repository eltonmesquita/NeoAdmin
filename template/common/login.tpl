<?php echo $header; ?>
<div id="content">
  <div class="box" style="width: 400px; min-height: 300px; margin-top: 40px; margin-left: auto; margin-right: auto;">
    <div class="heading">
      <h1><?php echo $text_login; ?></h1>
    </div>
    <div class="content" style="min-height: 150px; overflow: hidden;">
      <?php if ($success) { ?>
      <div class="success"><?php echo $success; ?></div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
      <?php } ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="row">
          <div class="large-5 columns">
            <img src="view/image/login.png" alt="<?php echo $text_login; ?>" />
          </div>
          <div class="large-7 columns">
            <p><?php echo $entry_username; ?><br />
            <input type="text" name="username" value="<?php echo $username; ?>" style="margin-top: 4px;" /></p>
            <p><?php echo $entry_password; ?><br />
            <input type="password" name="password" value="<?php echo $password; ?>" style="margin-top: 4px;" /></p>
            <?php if ($forgotten) { ?>
            <p><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p>
            <?php } ?>
            <p><a onclick="$('#form').submit();" class="button save"><?php echo $button_login; ?></a></p>
            <?php if ($redirect) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#form').submit();
	}
});
//--></script> 
<?php echo $footer; ?>