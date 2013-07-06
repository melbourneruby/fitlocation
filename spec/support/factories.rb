Fabricator(:user) do
  name					"Test User"
  email					"test@domain.com"
  password				"testtest"
  password_confirmation	"testtest"
end

Fabricator(:alt_user, from: :user) do
  name					"Second User"
  email					"second@domain.com"
  password 				"testtest"
  password_confirmation "testtest"
end