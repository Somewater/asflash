module ApplicationHelper
  def each_with_borders(array, &block)
    last_index = array.size - 1
    index = 0
    array.each do |item|
      block.call(item, index, index == last_index)
      index += 1
    end
  end

  def section_path(id)
    if(id.to_s == Section::MAIN_NAME || (id.is_a?(Section) && id.main?))
      '/'
    else
      super
    end
  end

  def url_for_params(params)
    url_for(params.merge(params))
  end
  
  def human_file_size(bytes, options = {})
	 [bytes.to_f / 1_048_576, 0.01].max.round(2).to_s + ' ' + I18n.t('megabyte')
  end

  def sitemap_html(section)
    result = "<a href='" + section_path(section) + "'>" + section.title + "</a>"
    children = section.children
    unless children.blank?
      result << "<ul>"
      children.each do |child|
        result << "<li>"
        result << sitemap_html(child)
        result << "</li>"
      end
      result << "</ul>"
    end
    result
  end
  
  def render_main_menu_recursively(section, active, active_chain = nil)
    active_chain = active.chain(true) unless active_chain
    result = nil
    
    if(section.main?)
      result = ''
    else
      result = "<li#{ (active_chain.include?(section) ? ' class="active"' : '') 
                                          }><a href=\"#{ section_path(section) }\">#{ section.pretty_name }</a></li>"
    end
    
    if(active_chain.include?(section) && section.children.length > 0)
      result << '<ul class="nav nav-list">'
      section.children.each{|s|
        result << render_main_menu_recursively(s, active, active_chain)
      }
      result << '</ul>'
    end
    result
  end

  def paginate_collection(collection, current, page_half_quantity, &block)
    length = collection.length
    index = collection.index(current)
    start_index = [index - page_half_quantity, 0].max
    end_index = [index + page_half_quantity, length].min
    each_with_borders(collection[start_index...end_index]) do |item, idx, last|
      item_index = start_index + idx
      block.call(item, item_index, idx == 0 && item_index > 0, last && item_index < length - 1)
    end
  end
end
