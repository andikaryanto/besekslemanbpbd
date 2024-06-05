<?php if($this->session->userdata("idtbluser") != ''){?> <!--jika dia orang luar-->
<aside id="right-sidebar-nav">
    <ul id="chat-out" class="side-nav rightside-navigation">
        <li class="li-hover">
        <a href="#" data-activates="chat-out" class="chat-close-collapse right"><i class="mdi-navigation-close"></i></a>
        <div id="right-search" class="row">
            <form class="col s12">
                <div class="input-field">
                    <i class="mdi-action-search prefix"></i>
                    <input id="icon_prefix" type="text" class="validate">
                    <label for="icon_prefix">Search</label>
                </div>
            </form>
        </div>
        </li>
        <li class="li-hover">
            <ul class="chat-collapsible" data-collapsible="expandable">
            <li>
              <a href="<?php echo base_url()?>logoff/off" class="teal white-text" style="text-align:center;"> Logoff </a>

            </li>

            </ul>
        </li>
    </ul>
</aside>

<?php } ?>
