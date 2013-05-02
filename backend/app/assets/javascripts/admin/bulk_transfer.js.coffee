$ ->
  $('#bulk_receive_stock').click ->
    $('#source_location_id_field').toggle(!this.checked)

  $('button.bulk_add_variant').click (event) ->
    event.preventDefault()

    source = $('#bulk_variant_template').html()
    template = Handlebars.compile(source)

    variant_name = $('#bulk_variant option:selected').text()
    variant_id = $('#bulk_variant option:selected').val()
    quantity = $('#bulk_variant_quantity').val()

    rendered = template
      name: variant_name
      id: variant_id
      quantity: quantity

    $('#bulk_variants_tbody').append(rendered)
    $("#bulk_variant option[value=#{variant_id}]").remove()

  $('button.bulk_transfer').click ->
    unless $('input#variant\\[\\]').length > 0
      alert('no variants to transfer')
      false

