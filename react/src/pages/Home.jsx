import React from 'react';
import HeroSection from '../components/HeroSection';
import LogoMarquee from '../components/LogoMarquee';
import ProjectsSection from '../components/ProjectsSection';
import StatsSection from '../components/StatsSection';
import FaqSection from '../components/FaqSection';
import { motion } from 'framer-motion';

// Fade in wrapper component
const FadeInWhenVisible = ({ children }) => {
    return (
        <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.8, ease: "easeOut" }}
            variants={{
                visible: { opacity: 1, y: 0 },
                hidden: { opacity: 0, y: 50 }
            }}
        >
            {children}
        </motion.div>
    );
};

const Home = () => {
    return (
        <div className="home-page">
            <HeroSection />

            <FadeInWhenVisible>
                <LogoMarquee />
            </FadeInWhenVisible>

            <FadeInWhenVisible>
                <ProjectsSection />
            </FadeInWhenVisible>

            <StatsSection />

            <FadeInWhenVisible>
                <FaqSection />
            </FadeInWhenVisible>
        </div>
    );
};

export default Home;
