module ApplicationHelpers
  def github_file_url(file_path, version)
    "https://github.com/thoughtbot/bourbon/blob/v#{version}/core/#{file_path}"
  end

  def markdown(contents)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(
      renderer,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      no_intra_emphasis: true,
      smartypants: true,
      strikethrough: true,
      tables: true,
      with_toc_data: true
    )
    markdown.render(contents)
  end

  def page_description
    yield_content(:description) || data.site.description
  end

  def page_title
    if content_for?(:page_title)
      [data.site.name, yield_content(:page_title)].join(" - ")
    else
      [data.site.name, data.site.tagline].join(" - ")
    end
  end

  def preferred_url
    path = yield_content :preferred_path
    URI.join(ENV.fetch("URL"), path)
  end
end
