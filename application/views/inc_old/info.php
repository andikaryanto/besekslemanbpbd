<?php if ($this->session->flashdata('error')) {?>
<div id="card-alert" class="card red">
  <div class="card-content white-text">
    <p><i class="mdi-alert-error"></i> <?php echo $this->session->flashdata('error');?></p>
  </div>
  <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
  </button>
</div>
<?php } elseif ($this->session->flashdata('update')) { ?>
<div id="card-alert" class="card deep-purple">
  <div class="card-content white-text">
    <p><i class="mdi-action-info-outline"></i> <?php echo $this->session->flashdata('update');?></p>
  </div>
  <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
  </button>
</div>
<?php } elseif ($this->session->flashdata('insert')) { ?>
<div id="card-alert" class="card green">
  <div class="card-content white-text">
    <p><i class="mdi-navigation-check"></i> <?php echo $this->session->flashdata('insert');?></p>
  </div>
  <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
  </button>
</div>
<?php } elseif ($this->session->flashdata('delete')) { ?>

<div id="card-alert" class="card red">
  <div class="card-content white-text">
    <p><i class="mdi-alert-error"></i> <?php echo $this->session->flashdata('delete');?></p>
  </div>
  <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">×</span>
  </button>
</div>
<?php }
