module ApplicationHelper
  def title(t)
    @title = t
  end

  def title_suffix
    APP_CONFIG["title_suffix"]
  end

  def h1
    @title
  end

  def page_title
    !@title.nil? ? "#{@title} - #{title_suffix}" : title_suffix
  end

  def add_terms_button(name, form)
    new_term = Term.new
    id = new_term.object_id
    fields = form.simple_fields_for(:terms, new_term, child_index: id) do |t|
      render("fields_for_terms", t: t)
    end
    form.button :button, type: nil, name: nil, class: "add-term", data: {id: id, fields: fields.gsub("\n", "")} do
      "Lägg till"
    end
  end

  def separator(current, total, question=false)
    separator = ", " if total > current + 2
    separator = " eller " if total == current + 2
    separator = "?" if total == current + 1 && question
    separator
  end

  def number_to_words(number, alt = false)
    words = alt ? I18n.t("number_words_alt") : I18n.t("number_words")
    words[number] ? words[number] : number.to_s
  end

  def delete_icon_text
    raw "#{content_tag(:span, nil, class: 'icon-trash icon-large')} Radera"
  end

  def add_icon_text
    raw "#{content_tag(:span, nil, class: 'icon-plus')} Lägg till"
  end
end
