{* purpose of this template: build the Form to edit an instance of entry *}
{include file='user/header.tpl'}
{pageaddvar name='javascript' value='modules/Eternizer/javascript/Eternizer_editFunctions.js'}
{pageaddvar name='javascript' value='modules/Eternizer/javascript/Eternizer_validation.js'}

{if $mode eq 'edit'}
    {gt text='Edit entry' assign='templateTitle'}
{elseif $mode eq 'create'}
    {gt text='Create entry' assign='templateTitle'}
{else}
    {gt text='Edit entry' assign='templateTitle'}
{/if}
<div class="eternizer-entry eternizer-edit">
{pagesetvar name='title' value=$templateTitle}
<div class="z-frontendcontainer">
    <h2>{$templateTitle}</h2>
{form cssClass='z-form'}
    {* add validation summary and a <div> element for styling the form *}
    {eternizerFormFrame}
    {formsetinitialfocus inputId='ip'}

    <fieldset>
        <legend>{gt text='Content'}</legend>
        <div class="z-formrow">
            {formlabel for='ip' __text='Ip'}
            {formtextinput group='entry' id='ip' mandatory=false readOnly=false __title='Input the ip of the entry' textMode='singleline' maxLength=15 cssClass=''}
        </div>
        <div class="z-formrow">
            {formlabel for='text' __text='Text' mandatorysym='1'}
            {formtextinput group='entry' id='text' mandatory=true __title='Input the text of the entry' textMode='multiline' rows='6' cols='50' cssClass='required'}
            {eternizerValidationError id='text' class='required'}
        </div>
        <div class="z-formrow">
            {formlabel for='notes' __text='Notes'}
            {formtextinput group='entry' id='notes' mandatory=false __title='Input the notes of the entry' textMode='multiline' rows='6' cols='50' cssClass=''}
        </div>
    </fieldset>

    {if $mode ne 'create'}
        {include file='user/include_standardfields_edit.tpl' obj=$entry}
    {/if}

    {* include display hooks *}
    {if $mode eq 'create'}
        {notifydisplayhooks eventname='eternizer.ui_hooks.entries.form_edit' id=null assign='hooks'}
    {else}
        {notifydisplayhooks eventname='eternizer.ui_hooks.entries.form_edit' id=$entry.id assign='hooks'}
    {/if}
    {if is_array($hooks) && isset($hooks[0])}
        <fieldset>
            <legend>{gt text='Hooks'}</legend>
            {foreach key='hookName' item='hook' from=$hooks}
            <div class="z-formrow">
                {$hook}
            </div>
            {/foreach}
        </fieldset>
    {/if}

    {* include return control *}
    {if $mode eq 'create'}
        <fieldset>
            <legend>{gt text='Return control'}</legend>
            <div class="z-formrow">
                {formlabel for='repeatcreation' __text='Create another item after save'}
                {formcheckbox group='entry' id='repeatcreation' readOnly=false}
            </div>
        </fieldset>
    {/if}

    {* include possible submit actions *}
    <div class="z-buttons z-formbuttons">
    {if $mode eq 'edit'}
        {formbutton id='btnUpdate' commandName='update' __text='Update entry' class='z-bt-save'}
      {if !$inlineUsage}
        {gt text='Really delete this entry?' assign="deleteConfirmMsg"}
        {formbutton id='btnDelete' commandName='delete' __text='Delete entry' class='z-bt-delete z-btred' confirmMessage=$deleteConfirmMsg}
      {/if}
    {elseif $mode eq 'create'}
        {formbutton id='btnCreate' commandName='create' __text='Create entry' class='z-bt-ok'}
    {else}
        {formbutton id='btnUpdate' commandName='update' __text='OK' class='z-bt-ok'}
    {/if}
        {formbutton id='btnCancel' commandName='cancel' __text='Cancel' class='z-bt-cancel'}
    </div>
  {/eternizerFormFrame}
{/form}

</div>
</div>
{include file='user/footer.tpl'}

{icon type='edit' size='extrasmall' assign='editImageArray'}
{icon type='delete' size='extrasmall' assign='deleteImageArray'}

<script type="text/javascript" charset="utf-8">
/* <![CDATA[ */
    var editImage = '<img src="{{$editImageArray.src}}" width="16" height="16" alt="" />';
    var removeImage = '<img src="{{$deleteImageArray.src}}" width="16" height="16" alt="" />';

    document.observe('dom:loaded', function() {

        eternizerAddCommonValidationRules('entry', '{{if $mode eq 'create'}}{{else}}{{$entry.id}}{{/if}}');

        // observe button events instead of form submit
        var valid = new Validation('{{$__formid}}', {onSubmit: false, immediate: true, focusOnError: false});
        {{if $mode ne 'create'}}
            var result = valid.validate();
        {{/if}}

        $('{{if $mode eq 'create'}}btnCreate{{else}}btnUpdate{{/if}}').observe('click', function(event) {
            var result = valid.validate();
            if (!result) {
                // validation error, abort form submit
                Event.stop(event);
            } else {
                // hide form buttons to prevent double submits by accident
                $$('div.z-formbuttons input').each(function(btn) {
                    btn.hide();
                });
            }
            return result;
        });

        Zikula.UI.Tooltips($$('.eternizerFormTooltips'));
    });

/* ]]> */
</script>