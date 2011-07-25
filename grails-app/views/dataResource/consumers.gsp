<%@ page import="au.org.ala.collectory.DataResource;au.org.ala.collectory.Institution;au.org.ala.collectory.Collection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="dataResource.base.label" default="Edit data resource metadata" /></title>
        <link rel="stylesheet" href="${resource(dir:'css/smoothness',file:'jquery-ui-1.8.14.custom.css')}" type="text/css" media="screen"/>
        <g:javascript library="jquery-1.5.1.min"/>
        <g:javascript library="jquery-ui-1.8.14.custom.min"/>
    </head>
    <body>
        <div class="nav">
        <h1>Editing: ${command.name}</h1>
        </div>
        <div id="baseForm" class="body">
            <g:if test="${message}">
            <div class="message">${message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="baseForm" action="base">
                <g:hiddenField name="id" value="${command?.id}" />
                <g:hiddenField name="version" value="${command.version}" />
                <g:hiddenField name="source" value="${source}" />
                <g:hiddenField name="consumers" value="${command.listConsumers().findAll{it[0..1] == source}.join(',')}" />
                <g:set var="list" value="${(source == 'co' ? Collection.list([sort:'name']) : Institution.list([sort:'name']))}"/>
                <g:set var="type" value="${(source == 'co') ? 'collection' : 'institution'}"/>
                <div class="dialog">
                    <div>
                        <p style="padding-top:10px;">Drag a ${type} to the consumers box to add it as a record consumer. Or just click the ${type} to add it.<br/>
                        Drag or click a record comsumer to remove it.</p>
                    </div>
                    <div id="not-selected" class="container">
                        <h1>${source == 'co' ? 'Collections' : 'Institutions'}:</h1>
                        <ul>
                            <g:each in="${list}" var="c">
                                <g:if test="${!(c.uid in command.listConsumers())}">
                                    <li id="${c.uid}" class="draggable">${c.name}</li>
                                </g:if>
                            </g:each>
                        </ul>
                    </div>
                    <div id="selected" class="container">
                        <h1>Record consumers.</h1>
                        <g:if test="${!command.listConsumers().findAll{it[0..1] == source}}">
                            <p>Drag consumers to here.</p>
                        </g:if>
                        <ul>
                            <g:each in="${list}" var="c">
                                <g:if test="${c.uid in command.listConsumers()}">
                                    <li id="${c.uid}" class="draggable">${c.name}</li>
                                </g:if>
                            </g:each>
                        </ul>
                    </div>
                </div>
                
                <div style="clear:both;"></div>
                <div class="buttons">
                    <span class="button"><input type="submit" name="_action_updateConsumers" value="Update" class="save"></span>
                    <span class="button"><input type="submit" name="_action_cancel" value="Cancel" class="cancel"></span>
                </div>
            </g:form>
        </div>
        <script type="text/javascript">
            var $to = $('#selected');
            var $from = $('#not-selected');
            $(function() {
        		$( ".draggable" ).draggable({ revert: "invalid", scroll: false, helper: 'clone' });
		        $to.droppable({
                    accept: function(me) {
                        return $(me).parent().parent().attr('id') == 'not-selected';
                    },
                    hoverClass: "ui-state-active",
                    drop: function( event, ui ) {
                        placeItem(ui.draggable, $to);
                    }
                });
		        $from.droppable({
                    accept: function(me) {
                        return $(me).parent().parent().attr('id') == 'selected';
                    },
                    hoverClass: "ui-state-active",
                    drop: function( event, ui ) {
                        placeItem(ui.draggable, $from);
                    }
                });
                $('.draggable').click(function(){
                    if ($(this).parent().parent().attr('id') == 'not-selected') {
                        placeItem($(this), $to);
                    } else {
                        placeItem($(this), $from);
                    }
                });
	        });
            function placeItem( $item , $target) {
                $item.fadeOut(function() {
                    $('#selected p').remove();
                    var $list = $( "ul", $target ).appendTo( $target );
                    $item.css({'top':'','left':''});
                    $item.appendTo( $list ).fadeIn(function() {
                        var consumers = new Array();
                        $.each($('#selected li'), function(index, value) {
                            consumers.push($(value).attr('id'));
                        });
                        $("input[name='consumers']").attr('value',consumers);
                    });
                });
            }
        </script>
    </body>
</html>
