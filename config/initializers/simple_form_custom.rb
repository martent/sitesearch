SimpleForm.setup do |config|
  config.wrappers :basic, tag: 'div', class: 'form-group', error_class: 'warning' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'span', class: 'control-label' do |label|
      b.use :label, class: nil
    end
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :addon, tag: 'div', class: 'form-group', error_class: 'warning' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'span', class: 'control-label' do |label|
      b.use :label, class: nil
    end
    b.wrapper tag: 'div', class: 'controls input-group' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
end
