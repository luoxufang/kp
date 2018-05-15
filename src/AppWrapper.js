import {Text , StyleSheet} from 'react-native'
import React from 'react'

const App = () =>{
    return <Text style ={styles.text}></Text>
}
export default App

const styles = StyleSheet.create({
    text:{
        marginTop: 100,
        alignSelf: 'center',
        fontSize: 50
    }
})