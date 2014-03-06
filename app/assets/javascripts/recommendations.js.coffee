$('#recommendation_term_list').tokenInput(
  $('#recommendation_term_list').data("path"), {
    prePopulate: $('#recommendation_term_list').data('load')
    hintText: "Lägg till sökord"
    theme: 'malmo'
    searchDelay: 0
    minChars: 2
    allowTabOut: true
    animateDropdown: false
  }
)
