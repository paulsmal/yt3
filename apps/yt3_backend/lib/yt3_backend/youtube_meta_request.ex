defmodule YT3.Fetcher.YoutubeMetaRequest do
  require HTTPoison.Base
  use HTTPoison.Base

  @youtube_meta_url "https://www.youtube.com/get_video_info?video_id="
  @meta_fields ~w(title thumbnail_url length_seconds author)

  def process_url(id) do
    @youtube_meta_url <> id
  end

  def process_response_body(""), do: :nil

  def process_response_body(body) do
    body
    |> URI.decode_query
    |> IO.inspect
    |> Map.take(@meta_fields)
  end
end

