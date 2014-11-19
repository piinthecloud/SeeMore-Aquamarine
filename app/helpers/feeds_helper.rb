module FeedsHelper

  def get_vimeo_handle(url)
    new_url = url.scan(/\/\w+.$/).join("").delete("/")
  end

end
