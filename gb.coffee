VAT = 1.14
Array::remove = (e) -> @.splice(t, 1) if (t = @indexOf(e)) > -1

class ModelObject

    #base class to play with django backend apish hack
    #expects json result sporting a status (int) and data (payload)
    #lots of assumptions on the django interface
        # 1 - pythetic http://brettsonian.webfactional.com/pythetic.git
        # 2 - pythetic entry point is /api
    
    #DEPENDS: jquery


    getByID: (id) ->
        @_busy = true
        $.get '/api/get_by_id/', params: model: @model, id: id
        .success (data, status, headers, config) =>
            @_busy = false
            if data.status == 0
                @constructor(data.data)
            else
                @constructor({})

# 	@getAll: ({includes, excludes, limit, filter, order_by, distinct} = {}) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.get_model_all,
# 			model: if @model? then @model else @name
# 			includes: includes
# 			excludes: excludes
# 			limit: limit
# 			start: filter.start if filter?
# 			end: filter.end if filter?
# 			order_by: order_by
# 			distinct: distinct
# 
# 	@aggregate: (group_fields, annotation_fields, filter_conditions) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.aggregate_model,
# 			model: if @model? then @model else @name
# 			group_fields: group_fields
# 			annotation_fields: annotation_fields
# 			filter_conditions: filter_conditions
# 
# 
# 	@renderTemplate: (template, dataObject) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.render_template,
# 			template: template
# 			data: dataObject
# 
# 	@sendHTMLEmail: (html_content, email_address, from_email, subject) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.send_html_email,
# 			html_content: html_content
# 			email_address: email_address
# 			from_email: from_email
# 			subject: subject
# 
# 	@sendTwilioSMS: (message, number) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.send_twilio_SMS,
# 			message: message
# 			number: number
# 
# 	@sql: (sqlText) ->
# 		$.get "/warehouse/sql/", "sqltext": sqlText
# 
# 	@sendEmail: (fromAddress, toAddress, subject, message) ->
# #		$.get "/warehouse/send_email/#{toAddress}/#{fromAddress}/#{subject}/#{message}/",
# 		$.get "/warehouse/send_email/",
# 			to: toAddress
# 			from: fromAddress
# 			subject: subject
# 			message: message
# 
# 
# 	save: ->
# 		if not @model
# 			@model = if @name? then @name else @.constructor.name
# 		promise = gbdajaxice Dajaxice.gascoweb.gcw.save_model, obj: @
# 		promise.then (data) =>
# 			@constructor(data.data)
# 			return promise
# 
# 	update: (field_to_update, value) ->
# 		if not @model
# 			@model = if @name? then @name else @.constructor.name
# 		promise = gbdajaxice Dajaxice.gascoweb.gcw.update_model,
# 			model: @model,
# 			id: @id,
# 			field_to_update: field_to_update,
# 			value: value
# 
# 		promise.then (data) =>
# 			@constructor(data.data)
# 			return promise
# 
# 	print: (url) ->
# 		gbdajaxice Dajaxice.gascoweb.gcw.print_pdf_generic,
# 			url: url
