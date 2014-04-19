module SeoHelper
  def seo_description
    if content_for?(:seo_description)
      content_for(:seo_description)
    else
      raise 'Missing seo_description'
    end
  end

  def seo_title
    if content_for?(:seo_title)
      content_for(:seo_title)
    else
      raise 'Missing seo_title'
    end
  end

  def seo_canonical
    if content_for?(:seo_canonical)
      content_for(:seo_canonical)
    else
      raise 'Missing seo_canonical'
    end
  end
end
