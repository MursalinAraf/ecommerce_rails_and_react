import React from "react";
import { Form, Field } from "react-final-form";
import { Input, InputLabel } from "@mui/material";
import { Button } from "@mui/material";

const RegisterComponent = () => {
  const onSubmit = (values) => {
    console.log(values);
  };

  return (
    <div className="h-full flex items-center justify-center">
      <Form
        onSubmit={onSubmit}
        render={({ handleSubmit }) => (
          <form onSubmit={handleSubmit} className="w-96">
            <div className="my-4 text-3xl font-bold">Please Register</div>

            <Field
              name="first_name"
              render={({ input, meta }) => (
                <div className="mb-4 w-full">
                  <InputLabel className="block mb-1">First Name</InputLabel>
                  <Input
                    {...input}
                    fullWidth
                    className="w-full border border-gray-300 rounded-md p-2 focus:border-blue-400"
                    onChange={input.onChange}
                    error={meta.submitError}
                    value={input.value}
                  />
                </div>
              )}
            />

            <Field
              name="last_name"
              render={({ input, meta }) => (
                <div className="mb-4 w-full">
                  <InputLabel className="block mb-1">Last Name</InputLabel>
                  <Input
                    onChange={input.onChange}
                    error={meta.submitError}
                    value={input.value}
                    fullWidth
                    className="w-full"
                    variant="outlined"
                  />
                </div>
              )}
            />

            <Field
              name="email"
              render={({ input, meta }) => (
                <div className="mb-4 w-full">
                  <InputLabel className="block mb-1">Email</InputLabel>
                  <Input
                    variant="outlined"
                    onChange={input.onChange}
                    error={meta.submitError}
                    value={input.value}
                    fullWidth
                    className="w-full"
                  />
                </div>
              )}
            />

            <div className="mt-4">
              <Button
                type="submit"
                variant="contained"
                color="primary"
                fullWidth
              >
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
