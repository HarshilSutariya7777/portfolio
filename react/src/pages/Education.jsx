import React from 'react';
import { motion } from 'framer-motion';
import EducationCard from '../components/EducationCard';
import './Education.css';

const FadeIn = ({ children, delay = 0, direction = 'up' }) => {
    const variants = {
        hidden: {
            opacity: 0,
            y: direction === 'up' ? 30 : 0,
            x: direction === 'left' ? -30 : (direction === 'right' ? 30 : 0)
        },
        visible: {
            opacity: 1,
            y: 0,
            x: 0
        }
    };

    return (
        <motion.div
            initial="hidden"
            whileInView="visible"
            viewport={{ once: true, margin: "-50px" }}
            transition={{ duration: 0.8, delay, ease: "easeOut" }}
            variants={variants}
        >
            {children}
        </motion.div>
    );
};

const Education = () => {
    const educationList = [
        {
            title: 'Master of Computer Application (MCA)',
            subtitle: 'Charusat University, Changa, Anand (July 2024 – Expected May 2026)',
            details: [],
            link: 'https://drive.google.com/file/d/1K8kzFppjMEcwfe8RTTuCUrom-M5LlKew/view?usp=sharing'
        },
        {
            title: 'Bachelor of Computer Application (BCA)',
            subtitle: 'Sutex Bank College of Computer Applications & Science (July 2021 – April 2024)',
            details: ['Distinction'],
            link: 'https://drive.google.com/file/d/1EPB9lh1s_PKLnE6lpHU3xRIZjSOIvi97/view?usp=sharing'
        },
        {
            title: 'Diploma in Flutter Development',
            subtitle: 'Creative Multimedia Institute (Jan 2022 – Dec 2023)',
            details: ['Distinction'],
            link: 'https://drive.google.com/file/d/1bJqmhWy7zQQTyVvDuPL5CPsCqRoV2YIY/view?usp=sharing'
        },
        {
            title: 'Higher Secondary Education',
            subtitle: 'Ashadeep Vidhyalaya – 3 (Jun 2020 – Mar 2021)',
            details: ['Distinction'],
            link: 'https://drive.google.com/file/d/1DfGGXDtejq89O0SuJXtfRb1kHA0zOP_6/view?usp=sharing'
        },
        {
            title: 'Secondary Education',
            subtitle: 'Ashadeep International School (Jun 2018 – Mar 2019)',
            details: ['Distinction'],
            link: 'https://drive.google.com/file/d/1jgovZHF5uxWxcrvGVdxUlDtOCqcFqctq/view?usp=sharing'
        },
    ];

    return (
        <div className="education-page">
            <div className="container education-container">
                <div className="education-header">
                    <motion.h1
                        className="education-title"
                        initial={{ opacity: 0, y: 30 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.8 }}
                    >
                        MY EDUCATION
                    </motion.h1>
                    <motion.p
                        className="education-desc"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: 0.2, duration: 0.8 }}
                    >
                        Exploring my academic journey and professional development
                    </motion.p>
                </div>

                <div className="education-list">
                    {educationList.map((edu, index) => (
                        <FadeIn key={index} delay={0.3 + (index * 0.1)} direction="left">
                            <EducationCard
                                title={edu.title}
                                subtitle={edu.subtitle}
                                details={edu.details}
                                link={edu.link}
                            />
                        </FadeIn>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default Education;
