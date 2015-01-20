host "https://jinni.com.ua"

sitemap :site do
  url root_url, last_mod: Time.zone.now, change_freq: "daily", priority: 1.0
  url projects_url

  Project.approved.published.each do |project|
    url project, last_mod: project.updated_at, priority: (project.featured ? 1.0 : 0.7)
  end
end

# Ping search engines after sitemap generation:
#
ping_with "https://#{host}/sitemap.xml"