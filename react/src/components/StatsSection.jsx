import React from 'react';
import { motion, useInView } from 'framer-motion';
import { useRef, useEffect, useState } from 'react';
import './StatsSection.css';

const AnimatedStatItem = ({ targetValue, label, isFloat = false, suffix = '' }) => {
    const ref = useRef(null);
    const isInView = useInView(ref, { once: true, margin: "-50px" });
    const [count, setCount] = useState(0);

    useEffect(() => {
        if (isInView) {
            let start = 0;
            const end = targetValue;
            const duration = 2000;
            const incrementTime = 20;
            const step = end / (duration / incrementTime);

            const timer = setInterval(() => {
                start += step;
                if (start >= end) {
                    setCount(end);
                    clearInterval(timer);
                } else {
                    setCount(start);
                }
            }, incrementTime);

            return () => clearInterval(timer);
        }
    }, [isInView, targetValue]);

    return (
        <div className="stat-item" ref={ref}>
            <h3 className="stat-value">
                {isFloat ? count.toFixed(1) : Math.floor(count)}
                {suffix}
            </h3>
            <p className="stat-label">{label}</p>
        </div>
    );
};

const StatsSection = () => {
    return (
        <section className="stats-section">
            <div className="container stats-container">
                <AnimatedStatItem
                    targetValue={9.0}
                    label="CGPA"
                    isFloat={true}
                />
                <AnimatedStatItem
                    targetValue={8}
                    label="PROJECTS COMPLETED"
                    suffix="+"
                />
                <AnimatedStatItem
                    targetValue={100}
                    label="SATISFACTION"
                    suffix="%"
                />
            </div>
        </section>
    );
};

export default StatsSection;
