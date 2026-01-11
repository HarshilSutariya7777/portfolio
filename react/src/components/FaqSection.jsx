import React, { useState } from 'react';
import { Plus, Minus } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import './FaqSection.css';

const FaqItem = ({ question, answer }) => {
    const [isExpanded, setIsExpanded] = useState(false);

    return (
        <div className="faq-item">
            <div
                className="faq-question-container"
                onClick={() => setIsExpanded(!isExpanded)}
            >
                <div className="faq-question-wrapper">
                    <h3 className="faq-question">{question.toUpperCase()}</h3>
                    <div className="faq-icon">
                        {isExpanded ? <Minus size={24} /> : <Plus size={24} />}
                    </div>
                </div>
            </div>

            <AnimatePresence>
                {isExpanded && (
                    <motion.div
                        initial={{ height: 0, opacity: 0 }}
                        animate={{ height: 'auto', opacity: 1 }}
                        exit={{ height: 0, opacity: 0 }}
                        transition={{ duration: 0.3, ease: "easeInOut" }}
                        className="faq-answer-container"
                    >
                        <p className="faq-answer">{answer}</p>
                    </motion.div>
                )}
            </AnimatePresence>
        </div>
    );
};

const FaqSection = () => {
    const faqs = [
        {
            question: 'How to begin a project with me?',
            answer: 'Simply contact me via the contact form or email, and we can discuss your requirements.',
        },
        {
            question: 'What are my project charges?',
            answer: 'Charges vary based on project complexity and scope. Contact me for a quote.',
        },
        {
            question: "What's included in my work?",
            answer: 'I provide end-to-end development, including design, implementation, and deployment support.',
        },
    ];

    return (
        <section className="faq-section">
            <div className="container faq-container">
                <h2 className="section-title faq-title">FREQUENTLY ASKED QUESTIONS</h2>

                <div className="faq-list">
                    {faqs.map((faq, index) => (
                        <FaqItem key={index} question={faq.question} answer={faq.answer} />
                    ))}
                </div>
            </div>
        </section>
    );
};

export default FaqSection;
