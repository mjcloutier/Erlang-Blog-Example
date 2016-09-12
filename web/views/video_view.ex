defmodule Blog.VideoView do
  use Blog.Web, :view

  def render("index.json", %{videos: videos}) do
    %{data: render_many(videos, Blog.VideoView, "video.json")}
  end

  def render("show.json", %{video: video}) do
    %{data: render_one(video, Blog.VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{id: video.id,
      title: video.title,
      description: video.description,
      picture: video.picture,
      filename: video.filename,
      created: video.created}
  end
end
