import React from "react";
import { Form, Field } from "react-final-form";
import { Input, Button } from "antd";

const RegisterComponent = () => {
  const onSubmit = (values) => {
    console.log(values);
  };

  return (
    <div className="h-screen flex items-center justify-center">
      <Form
        onSubmit={onSubmit}
        render={({ handleSubmit }) => (
          <form onSubmit={handleSubmit} className="w-96">
            <div className="my-4 text-3xl font-bold text-center">
              Please Register
            </div>

            <Field
              name="first_name"
              render={({ input }) => (
                <div className="mb-4">
                  <label className="block mb-1 font-medium">First Name</label>
                  <Input {...input} placeholder="Enter first name" />
                </div>
              )}
            />

            <Field
              name="last_name"
              render={({ input }) => (
                <div className="mb-4">
                  <label className="block mb-1 font-medium">Last Name</label>
                  <Input {...input} placeholder="Enter last name" />
                </div>
              )}
            />

            <Field
              name="email"
              render={({ input }) => (
                <div className="mb-4">
                  <label className="block mb-1 font-medium">Email</label>
                  <Input {...input} placeholder="Enter email" />
                </div>
              )}
            />

            <Field
              name="password"
              render={({ input }) => (
                <div className="mb-4">
                  <label className="block mb-1 font-medium">Password</label>
                  <Input.Password {...input} placeholder="Enter password" />
                </div>
              )}
            />

            <Field
              name="confirm_password"
              render={({ input }) => (
                <div className="mb-4">
                  <label className="block mb-1 font-medium">
                    Confirm Password
                  </label>
                  <Input.Password {...input} placeholder="Re-Enter Password" />
                </div>
              )}
            />

            <div className="mt-4">
              <Button type="primary" htmlType="submit" className="w-full">
                Register
              </Button>
            </div>
          </form>
        )}
      />
    </div>
  );
};

export default RegisterComponent;
