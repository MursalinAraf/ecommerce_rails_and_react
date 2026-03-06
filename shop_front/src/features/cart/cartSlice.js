import { createSlice } from '@reduxjs/toolkit'

const initialState = {
    items: [],
    totalQuantity: 0,
    totalPrice: 0
}

const cartSlice = createSlice({
    name: "cart",
    initialState,
    reducers: {
        addToCart: (state, action) => {
            const product = action.payload

            state.items.push({...product})
        }
    }
})

export default cartSlice.reducer

export const {addToCart} = cartSlice.actions