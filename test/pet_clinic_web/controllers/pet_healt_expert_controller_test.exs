defmodule PetClinicWeb.PetHealtExpertControllerTest do
  use PetClinicWeb.ConnCase

  import PetClinic.PetClinicExpertsFixtures

  @create_attrs %{age: 42, email: "some email", name: "some name", sex: "some sex", specialities: "some specialities"}
  @update_attrs %{age: 43, email: "some updated email", name: "some updated name", sex: "some updated sex", specialities: "some updated specialities"}
  @invalid_attrs %{age: nil, email: nil, name: nil, sex: nil, specialities: nil}

  describe "index" do
    test "lists all petexperts", %{conn: conn} do
      conn = get(conn, Routes.pet_healt_expert_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Petexperts"
    end
  end

  describe "new pet_healt_expert" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pet_healt_expert_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pet healt expert"
    end
  end

  describe "create pet_healt_expert" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pet_healt_expert_path(conn, :create), pet_healt_expert: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pet_healt_expert_path(conn, :show, id)

      conn = get(conn, Routes.pet_healt_expert_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pet healt expert"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pet_healt_expert_path(conn, :create), pet_healt_expert: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pet healt expert"
    end
  end

  describe "edit pet_healt_expert" do
    setup [:create_pet_healt_expert]

    test "renders form for editing chosen pet_healt_expert", %{conn: conn, pet_healt_expert: pet_healt_expert} do
      conn = get(conn, Routes.pet_healt_expert_path(conn, :edit, pet_healt_expert))
      assert html_response(conn, 200) =~ "Edit Pet healt expert"
    end
  end

  describe "update pet_healt_expert" do
    setup [:create_pet_healt_expert]

    test "redirects when data is valid", %{conn: conn, pet_healt_expert: pet_healt_expert} do
      conn = put(conn, Routes.pet_healt_expert_path(conn, :update, pet_healt_expert), pet_healt_expert: @update_attrs)
      assert redirected_to(conn) == Routes.pet_healt_expert_path(conn, :show, pet_healt_expert)

      conn = get(conn, Routes.pet_healt_expert_path(conn, :show, pet_healt_expert))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, pet_healt_expert: pet_healt_expert} do
      conn = put(conn, Routes.pet_healt_expert_path(conn, :update, pet_healt_expert), pet_healt_expert: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pet healt expert"
    end
  end

  describe "delete pet_healt_expert" do
    setup [:create_pet_healt_expert]

    test "deletes chosen pet_healt_expert", %{conn: conn, pet_healt_expert: pet_healt_expert} do
      conn = delete(conn, Routes.pet_healt_expert_path(conn, :delete, pet_healt_expert))
      assert redirected_to(conn) == Routes.pet_healt_expert_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.pet_healt_expert_path(conn, :show, pet_healt_expert))
      end
    end
  end

  defp create_pet_healt_expert(_) do
    pet_healt_expert = pet_healt_expert_fixture()
    %{pet_healt_expert: pet_healt_expert}
  end
end
