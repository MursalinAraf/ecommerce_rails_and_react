import {
    apiSlice
} from "../apiSlice";

const authApi = apiSlice.injectEndpoints({
    endpoints: (builder) => ({
        register: builder.mutation({
            query: (payload) => ({
                url: "/register",
                method: "POST",
                body: payload
            })
        })
    })
})

export const {
    useRegisterMutation
} = authApi