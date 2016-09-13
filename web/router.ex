defmodule Blog.Router do
  use Blog.Web, :router

  # For authentication
  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_user_token
  end

  defp put_user_token(conn, _) do
     if current_user = conn.assigns[:current_user] do
       token = Phoenix.Token.sign(conn, "user socket", current_user.id)
       assign(conn, :user_token, token)
     else
      #  conn
      assign(conn, :user_token, "current_user")
     end
   end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/", Blog do
    # pipe_through :browser # Use the default browser stack
    pipe_through [:browser, :browser_auth]

    get "/", RoomController, :index

    # get "/", RoomController, :index
    get "/publish_item", PageController, :publish_item

    resources "/rooms", RoomController
    resources "/users", UserController
  end

  resources "/posts", PostController

  # Other scopes may use custom stacks.
  # scope "/api", Blog do
  #   pipe_through :api
  # end
  scope "/api", Blog do
    resources "/chat_messages", ChatMessageController, except: [:new, :edit]
    resources "/item_lists", ItemListController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/videos", VideoController, except: [:new, :edit]
  end
end
