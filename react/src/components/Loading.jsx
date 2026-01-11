import React from 'react';
import { motion } from 'framer-motion';

const Loading = () => {
    return (
        <div style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '100vh',
            backgroundColor: '#fff',
            flexDirection: 'column',
            gap: '20px'
        }}>
            <motion.div
                animate={{
                    scale: [1, 1.2, 1],
                    rotate: [0, 180, 360],
                }}
                transition={{
                    duration: 2,
                    ease: "easeInOut",
                    times: [0, 0.5, 1],
                    repeat: Infinity,
                }}
                style={{
                    width: '50px',
                    height: '50px',
                    backgroundColor: '#000',
                    borderRadius: '10px'
                }}
            />
            <h2 style={{ fontFamily: 'Archivo, sans-serif', fontSize: '18px', fontWeight: 'bold' }}>Loading...</h2>
        </div>
    );
};

export default Loading;
